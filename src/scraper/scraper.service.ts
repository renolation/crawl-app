import { Injectable } from '@nestjs/common';
import { CreateScraperDto } from './dto/create-scraper.dto';
import { UpdateScraperDto } from './dto/update-scraper.dto';

import { PlaywrightCrawler, Dataset, log } from '@crawlee/playwright';
import { Scraper } from './entities/scraper.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ItemEntity } from './entities/item.entity';

// Define the getImageSrc method inside the class
function getImageSrc(imageElement: HTMLImageElement): string {
  if (imageElement.srcset) {
    const srcsetArray = imageElement.srcset.split(',').map(src => src.trim().split(' '));
    const src2x = srcsetArray.find(src => src[1] === '2x');
    if (src2x) {
      return src2x[0];
    }
    const src1x = srcsetArray.find(src => src[1] === '1x');
    if (src1x) {
      return src1x[0];
    }
  }
  return imageElement.src;
}

@Injectable()
export class ScraperService {

  constructor(
    @InjectRepository(Scraper)
    private scraperRepository: Repository<Scraper>,
    @InjectRepository(ItemEntity)
    private itemRepository: Repository<ItemEntity>,
  ) {
  }

  //region default
  create(createScraperDto: CreateScraperDto) {
    return 'This action adds a new scraper';
  }

  findAll() {
    return `This action returns all scraper`;
  }

  findOne(id: number) {
    return `This action returns a #${id} scraper`;
  }

  update(id: number, updateScraperDto: UpdateScraperDto) {
    return `This action updates a #${id} scraper`;
  }

  remove(id: number) {
    return `This action removes a #${id} scraper`;
  }

  //endregion


  async scrapeItems() {
    const crawler = new PlaywrightCrawler({
      requestHandler: async ({ page, request, enqueueLinks }) => {
        console.log(`Processing: ${request.url}`);

        const urlObj = new URL(request.url);
        const domain = urlObj.origin;
        console.log(`Domain: ${domain}`);

        await enqueueLinks({
          selector: '.types .type:not(:first-child)',
          baseUrl: domain,
        });

        if (!request.loadedUrl.endsWith('/items')) {
          await new Promise(resolve => setTimeout(resolve, 5000));
          try {
            await page.waitForSelector('table.items-table tr', { timeout: 10000 });
            await new Promise(resolve => setTimeout(resolve, 2000));
            const rows = await page.$$eval('table.items-table tr', rows => {
              console.log('Rows:', rows);
              return rows;
            });
            //region crawlItems
            const items = await page.$$eval('table.items-table tr', rows => {
              return rows.slice(1).map(row => { // Skip the first row (header)
                const cells = row.querySelectorAll('td');
                const imageElement = cells[0]?.querySelector('img');
                const nameElement = cells[1]?.querySelector('div.name');
                const subtypesElement = cells[1]?.querySelector('div.subtypes');
                const descriptionElement = cells[2];

                if (!imageElement || !nameElement || !subtypesElement || !descriptionElement) {
                  console.error('Missing element:', { imageElement, nameElement, subtypesElement, descriptionElement });
                  return null;
                }

                const imageSrc = imageElement.src;
                const name = nameElement.textContent.trim();
                const subtypes = subtypesElement.textContent.trim();
                const description = descriptionElement.textContent.trim();
                const qualityClass = Array.from(nameElement.classList).find(cls => cls.startsWith('quality'));
                const rank = qualityClass ? parseInt(qualityClass.replace('quality', ''), 10) : null;
                console.log(name + ' ' + subtypes + ' ' + description + ' ' + rank);

                return {
                  imageSrc,
                  name,
                  subtypes,
                  description,
                  rank,
                };
              }); // Filter out null items
            });
            const type = await page.$eval('a.router-link-active div.name', element => element.textContent.trim());

            console.log(`Items: ${request.loadedUrl}`, items.length);
            await this.saveItemsToDatabase(items, type);
            //endregion
            console.log(`Data: ${request.loadedUrl}:`, rows.length - 1);
          } catch (error) {
            log.error(`Error processing ${request.loadedUrl}: ${error.message}`);
          }
        }
      },
      // headless: false,
    });
    await crawler.run(['https://wuthering.gg/items/']);
  }

  async saveItemsToDatabase(items: any[], type: string) {

    let count = 0;
    for (const item of items) {
      count++;
      const existingItem = await this.itemRepository.findOne({
        where: { name: item.name },
      });

      if (!existingItem) {
        const newItem = this.itemRepository.create({
          name: item.name,
          subTypes: item.subtypes,
          description: item.description,
          rank: item.rank,
          type: type,
          imageUrl: item.imageSrc,
        });
        console.log(newItem);
        await this.itemRepository.save(newItem);
      }
    }
    console.log('Items saved to database:', count);
  }

  async scrapeWeapons() {
    const crawler = new PlaywrightCrawler({
      requestHandler: async ({ page, request }) => {
        console.log(`Processing: ${request.url}`);

        const urlObj = new URL(request.url);
        const domain = urlObj.origin;
        console.log(`Domain: ${domain}`);

        await page.waitForSelector('select#weapon-type', { timeout: 10000 });
        const options = await page.$$eval('select#weapon-type option', options => {
          return options.map(option => {
            if (option instanceof HTMLOptionElement) {
              return option.value;
            }
            return null;
          }).filter(value => value !== null);
        });

        console.log('Options:', options);

        for (const option of options.slice(1)) {
          await page.selectOption('select#weapon-type', option);
          console.log('Found weapons');
          await page.waitForSelector('ul.weapons > li a.weapon', { timeout: 10000 });

          const weaponData = await page.$$eval('ul.weapons > li a.weapon', items => {
            return items.map(item => {
              const anchor = item as HTMLAnchorElement;
              const img = anchor.querySelector('div.image img') as HTMLImageElement;
              const nameElement = anchor.querySelector('div.name');

              if (!anchor || !img || !nameElement) {
                console.error('Missing element:', { anchor, img, nameElement });
                return null;
              }


              const rankMatch = anchor.className.match(/quality(\d)/);
              const rank = rankMatch ? parseInt(rankMatch[1], 10) : null;

              const href = anchor.href;
              const imgSrc = img.src;
              const name = nameElement.textContent.trim();

              return {
                rank,
                href,
                imgSrc,
                name,
              };
            }).filter(item => item !== null); // Filter out null items
          });
//: todo: save it to the database
          console.log(`Data extracted for option ${option}:`, weaponData);
        }
      },
      headless: false,
    });
    await crawler.run(['https://wuthering.gg/weapons/']);
  }

  async scrapeElements() {
    const crawler = new PlaywrightCrawler({
      requestHandler: async ({ page, request }) => {
        console.log(`Processing: ${request.url}`);
        await page.waitForSelector('div.elements', { timeout: 10000 });

        const buttons = await page.$$eval('div.elements button', buttons => {
          return buttons.map(button => {
            const buttonElement = button as HTMLButtonElement;

            const imgElement = buttonElement.querySelector('img') as HTMLImageElement;
            if (!imgElement) {
              console.error('Missing img element:', { buttonElement });
              return null;
            }
            const name = imgElement.alt;
            // region Inline getImageSrc logic
            let imgSrc = imgElement.src;
            if (imgElement.srcset) {
              const srcsetArray = imgElement.srcset.split(',').map(src => src.trim().split(' '));
              const src2x = srcsetArray.find(src => src[1] === '2x');
              if (src2x) {
                imgSrc = src2x[0];
              } else {
                const src1x = srcsetArray.find(src => src[1] === '1x');
                if (src1x) {
                  imgSrc = src1x[0];
                }
              }
            }
            //endregion
            const className = buttonElement.className;
            const fetterMatch = className.match(/f(\d+)/);
            const fetter = fetterMatch ? parseInt(fetterMatch[1], 10) : null;
            return {
              name,
              imgSrc,
              fetter: fetter,
            };
          });
        });
        //: todo: save it to the database
        console.log('List of buttons:', buttons);
      },

    });
    await crawler.run(['https://wuthering.gg/echos/']);

  }

  async scrapeEchos() {
    const crawler = new PlaywrightCrawler({
      requestHandler: async ({ page, request }) => {
        console.log(`Processing: ${request.url}`);
        await page.waitForSelector('div.elements', { timeout: 20000 });
        const items = await page.$$eval('div.list div.item', items => {
          return items.map(item => {
            const itemElement = item as HTMLElement;

            const anchorElement = itemElement.querySelector('a') as HTMLAnchorElement;
            const href = anchorElement ? new URL(anchorElement.href).pathname : null;

            const imgElement = itemElement.querySelector('div.image img') as HTMLImageElement;


            // region Inline getImageSrc logic
            let imgSrc = imgElement.src;
            if (imgElement.srcset) {
              const srcsetArray = imgElement.srcset.split(',').map(src => src.trim().split(' '));
              const src2x = srcsetArray.find(src => src[1] === '2x');
              if (src2x) {
                imgSrc = src2x[0];
              } else {
                const src1x = srcsetArray.find(src => src[1] === '1x');
                if (src1x) {
                  imgSrc = src1x[0];
                }
              }
            }
            //endregion


            const nameElement = itemElement.querySelector('div.name') as HTMLElement;
            const name = nameElement ? nameElement.textContent.trim() : null;

            const costElement = itemElement.querySelector('div.cost') as HTMLElement;
            const cost = costElement ? costElement.textContent.trim() : null;

            const fetterElements = itemElement.querySelectorAll('div.fet');
            const fetters = Array.from(fetterElements).map(fetterElement => {
              const fetterMatch = fetterElement.className.match(/f(\d+)/);
              return fetterMatch ? parseInt(fetterMatch[1], 10) : null;
            }).filter(fetter => fetter !== null);


            return {
              href,
              imgSrc,
              name,
              cost: parseInt(cost, 10),
              fetters,
            };
          }).filter(item => item !== null); // Filter out null items
        });
        //: todo: save it to the database
        console.log('List of buttons:', items);
      },

    });
    await crawler.run(['https://wuthering.gg/echos/']);

  }

}
