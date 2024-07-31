import { Injectable } from '@nestjs/common';
import { CreateScraperDto } from './dto/create-scraper.dto';
import { UpdateScraperDto } from './dto/update-scraper.dto';

import { PlaywrightCrawler, Dataset, log } from '@crawlee/playwright';
import { Scraper } from './entities/scraper.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Injectable()
export class ScraperService {

  constructor(
    @InjectRepository(Scraper)
    private scraperRepository: Repository<Scraper>,
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

  getImageSrc(imageElement: HTMLImageElement): string {
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
          try {
            await page.waitForSelector('table.items-table tr', { timeout: 5000 });

            const items = await page.$$eval('table.items-table tr', rows => {
              return rows.slice(1).map(row => {
                const cells = row.querySelectorAll('td');
                const imageElement = cells[0]?.querySelector('img');
                const nameElement = cells[1]?.querySelector('div.name.quality3');
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
                const rankMatch = nameElement.className.match(/quality(\d)/);
                const rank = rankMatch ? parseInt(rankMatch[1], 10) : null;
                console.log(name + ' ' + subtypes + ' ' + description + ' ' + rank);

                return {
                  imageSrc,
                  name,
                  subtypes,
                  description,
                  rank,
                };
              }).filter(item => item !== null); // Filter out null items
            });
            //: todo: save it to the database
            console.log(`Data extracted from ${request.loadedUrl}:`, items);
          } catch (error) {
            log.error(`Error processing ${request.loadedUrl}: ${error.message}`);
          }
        }
      },
      headless: false,
    });
    await crawler.run(['https://wuthering.gg/items/']);
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
            const imgSrc = this.getImageSrc(imgElement);
            return {
              name,
              imgSrc,
            };
          });
        });
        //: todo: save it to the database
        console.log('List of buttons:', buttons);
      },

    });
    await crawler.run(['https://wuthering.gg/echos/']);

  }
}
