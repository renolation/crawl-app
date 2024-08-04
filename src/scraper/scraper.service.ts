import { Injectable } from '@nestjs/common';
import { CreateScraperDto } from './dto/create-scraper.dto';
import { UpdateScraperDto } from './dto/update-scraper.dto';
import { shuffle } from 'lodash';

import { log, PlaywrightCrawler } from '@crawlee/playwright';
import { Scraper } from './entities/scraper.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { In, Repository } from 'typeorm';
import { ItemEntity } from './entities/item.entity';
import { WeaponEntity } from './entities/weapon.entity';
import { WeaponLevelRank } from './entities/weapon_level_rank.entity';
import { SkillEntity } from './entities/skill.entity';

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
    @InjectRepository(WeaponEntity)
    private weaponRepository: Repository<WeaponEntity>,
    @InjectRepository(WeaponLevelRank)
    private weaponLevelRankRepository: Repository<WeaponLevelRank>,
    @InjectRepository(SkillEntity)
    private skillRepository: Repository<SkillEntity>,
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

  async test2() {
    return 'a';
  }

  async crawlDetail(hrefs: string[]) {
    const crawler = new PlaywrightCrawler({
      // headless: false,
      requestHandlerTimeoutSecs: 36000,
      maxConcurrency: 2,

      requestHandler: async ({ page, request }) => {

        await page.route('**/*', (route) => {
          const request = route.request();
          if (request.resourceType() === 'image') {
            route.abort();
          } else {
            route.continue();
          }
        });

        const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));
        await page.waitForSelector('.slider-handle-lower', { timeout: 1000 });
        await page.waitForTimeout(1000);

        // Get the current width of the slider element and multiply it by 3
        await page.evaluate(() => {
          const slider = document.querySelector('.slider-base') as HTMLElement;
          if (slider) {
            const currentWidth = slider.getBoundingClientRect().width;
            slider.style.width = `${currentWidth * 3}px`;
          }
        });

        const levelMinValue = 1;
        const levelMaxValue = 90;
        const rankMinValue = 1;
        const rankMaxValue = 5;


        await sleep(1000);

        const sliderLevelTrack = page.locator('.slider-base').nth(0);
        const sliderRankTrack = page.locator('.slider-base').nth(1);

        const sliderLevelOffsetWidth = await sliderLevelTrack.evaluate(el => el.getBoundingClientRect().width);
        const sliderRankOffsetWidth = await sliderRankTrack.evaluate(el => el.getBoundingClientRect().width);

        const sliderHandleWidth = await page.$eval('.slider-handle-lower', el => el.getBoundingClientRect().width);
        const correctedSliderRankOffsetWidth = sliderRankOffsetWidth - sliderHandleWidth;
        const correctedSliderLevelOffsetWidth = sliderLevelOffsetWidth - sliderHandleWidth;


        const sliderRankBox = await sliderRankTrack.boundingBox();
        if (!sliderRankBox) {
          throw new Error('Unable to find bounding box on sliderRankTrack');
        }

        const positionsRank = [];
        const positionsLevel = [];

        for (let valueLevel = levelMinValue; valueLevel <= levelMaxValue; valueLevel++) {
          const positionXLevel = valueLevel === levelMaxValue
            ? correctedSliderLevelOffsetWidth
            : (correctedSliderLevelOffsetWidth / (levelMaxValue - levelMinValue)) * (valueLevel - levelMinValue);
          positionsLevel.push(positionXLevel);
        }

        for (let valueRank = rankMinValue; valueRank <= rankMaxValue; valueRank++) {
          const positionXRank = valueRank === rankMaxValue
            ? correctedSliderRankOffsetWidth
            : (correctedSliderRankOffsetWidth / (rankMaxValue - rankMinValue)) * (valueRank - rankMinValue);
          positionsRank.push(positionXRank);
        }

        for (let i = 0; i < positionsLevel.length; i++) {
          await sliderLevelTrack.click({ force: true, position: { x: positionsLevel[i], y: 0 } });
          await sleep(1000);
          const currentLevelValue = await sliderLevelTrack.evaluate(el => {
            const handle = el.querySelector('.slider-handle-lower');
            return handle ? parseInt(handle.getAttribute('aria-valuenow'), 10) : null;
          });
          for (let j = 0; j < positionsRank.length; j++) {
            await sliderRankTrack.click({ force: true, position: { x: positionsRank[j], y: 0 } });
            await sleep(100);
            const currentRankValue = await sliderRankTrack.evaluate(el => {
              const handle = el.querySelector('.slider-handle-lower');
              return handle ? parseInt(handle.getAttribute('aria-valuenow'), 10) : null;
            });
            //: stats
            const stats = await page.$$eval('div.stats.head div.item', items =>
              items.map(item => ({
                text: item.querySelector('div.text')?.textContent.trim() || null,
                value: item.querySelector('div.value')?.textContent.trim() || null,
              })),
            );
            // console.log('data: ', stats);
            const consume = await page.$$eval('div.ascension ul.list li.consume', items =>
              items.map(item => ({
                name: item.querySelector('div.name')?.textContent.trim() || null,
                cost: item.querySelector('div.cost')?.textContent.trim() || null,
              })),
            );
            // console.log('consume: ', consume);

            const consumeValue = await this.getItemsFromConsume(consume);
            const itemIds = consumeValue.items;
            const costs = consumeValue.costs;

            //: ascension
            const maxLevel = (await page.$eval('div.ascension div.top-h2 span', span => span.textContent.match(/Max Level: (\d+)/)[1])).trim();
            // console.log('Max Level:', maxLevel);

            //: skill name
            const skillName = (await page.$eval('div.about.ability h3', name => name.textContent.trim())).trim();
            // console.log('Skill Name:', skillName);
            const skillDetail = (await page.$eval('div.about.ability div.container p', p => p.innerHTML.trim())).trim();
            console.log('Skill Detail:', skillDetail);

            const skillEntity = {
              name: skillName,
              value: skillDetail,
            };

            const skillAbout = (await page.$eval('div.about.info div.container p', p => p.innerHTML.trim())).trim();
            // console.log('Skill About:', skillAbout);

            const weapon = await this.weaponRepository.findOne({ where: { href: request.url } });
            // console.log('Weapon:', weapon);
            const skill = await this.saveSkillToDatabase(skillEntity);

            try {
              const newRank = this.weaponLevelRankRepository.create({
                rank: currentRankValue,
                level: currentLevelValue,
                weapon: weapon,
                skills: [skill],
                itemCounts: costs,
                stat1_name: stats[0].text,
                stat1_value: stats[0].value,
                stat2_name: stats[1].text,
                stat2_value: stats[1].value,
                ascension_max_level: parseInt(maxLevel, 10),
                items: itemIds,
                about: skillAbout,
              });
              const savedRank = await this.weaponLevelRankRepository.save(newRank);
              console.log(savedRank);
              await sleep(100);
            } catch (error) {
              if (error.code === '23505') { // Unique constraint violation
                console.log('Rank already exists, skipping save.');
              } else {
                throw error;
              }
            }
            await sleep(1000);
          }
        }


      },
    });

    await crawler.run(hrefs);
    console.log('Scraper has shut down.');
  }


//region crawl items
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
                  console.error('Missing element:', {
                    imageElement,
                    nameElement,
                    subtypesElement,
                    descriptionElement,
                  });
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
        console.log('Items saved to database:', count);
      } else {
        console.log('Item already exists:', existingItem);
      }
    }

  }

  async getItemByName(name: string) {
    return await this.itemRepository.findOne({ where: { name } });
  }

  //endregion
  //region weapon
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
          console.log('Type:', this.convertWeaponType(option));
          console.log('item:', weaponData[0]);
          await this.saveWeaponsToDatabase(weaponData, this.convertWeaponType(option));
          console.log(`Data extracted for option ${option}:`, weaponData);
        }
      },
      // headless: false,
    });
    await crawler.run(['https://wuthering.gg/weapons/']);
  }

  convertWeaponType(value: string): string {
    switch (parseInt(value, 10)) {
      case 0:
        return 'All';
      case 1:
        return 'Broadblade';
      case 2:
        return 'Sword';
      case 3:
        return 'Pistols';
      case 4:
        return 'Gauntlets';
      case 5:
        return 'Rectifier';
      default:
        throw new Error('Invalid weapon type value');
    }
  }

  async saveWeaponsToDatabase(weapons: any[], type: string) {

    let count = 0;
    for (const weapon of weapons) {
      count++;
      const existingWeapon = await this.weaponRepository.findOne({
        where: { name: weapon.name, href: weapon.href },
      });

      if (!existingWeapon) {
        const newWeapon = this.weaponRepository.create({
          name: weapon.name,
          href: weapon.href,
          rank: weapon.rank,
          type: type,
          imageUrl: weapon.imgSrc,
        });
        console.log(newWeapon);
        await this.weaponRepository.save(newWeapon);
      }
    }
    console.log('Weapons saved to database:', count);
  }

  async scrapeWeapon(hrefs: string[]) {
    const crawler = new PlaywrightCrawler({
      maxConcurrency: 2,
      requestHandler: async ({ page, request, enqueueLinks }) => {
        console.log(`Processing: ${request.url}`);

        await page.waitForSelector('div.stats.head div.item', { timeout: 10000 });

        //: stats
        const stats = await page.$$eval('div.stats.head div.item', items =>
          items.map(item => ({
            text: item.querySelector('div.text')?.textContent.trim() || null,
            value: item.querySelector('div.value')?.textContent.trim() || null,
          })),
        );
        console.log('data: ', stats);
        const consume = await page.$$eval('div.ascension ul.list li.consume', items =>
          items.map(item => ({
            name: item.querySelector('div.name')?.textContent.trim() || null,
            cost: item.querySelector('div.cost')?.textContent.trim() || null,
          })),
        );
        console.log('consume: ', consume);

        const consumeValue = await this.getItemsFromConsume(consume);
        const itemIds = consumeValue.items;
        const costs = consumeValue.costs;

        //: ascension
        const maxLevel = (await page.$eval('div.ascension div.top-h2 span', span => span.textContent.match(/Max Level: (\d+)/)[1])).trim();
        console.log('Max Level:', maxLevel);

        //: skill name
        const skillName = (await page.$eval('div.about.ability h3', name => name.textContent.trim())).trim();
        console.log('Skill Name:', skillName);
        const skillDetail = (await page.$eval('div.about.ability div.container p', p => p.innerHTML.trim())).trim();
        console.log('Skill Detail:', skillDetail);

        const skillEntity = {
          name: skillName,
          value: skillDetail,
        };

        const skillAbout = (await page.$eval('div.about.info div.container p', p => p.innerHTML.trim())).trim();
        console.log('Skill About:', skillAbout);

        const weapon = await this.weaponRepository.findOne({ where: { href: request.url } });
        console.log('Weapon:', weapon);
        const skill = await this.saveSkillToDatabase(skillEntity);

        try {
          const newRank = this.weaponLevelRankRepository.create({
            rank: 1,
            level: 1,
            weapon: weapon,
            skills: [skill],
            itemCounts: costs,
            stat1_name: stats[0].text,
            stat1_value: stats[0].value,
            stat2_name: stats[1].text,
            stat2_value: stats[1].value,
            ascension_max_level: parseInt(maxLevel, 10),
            items: itemIds,
            about: skillAbout,
          });
          const savedRank = await this.weaponLevelRankRepository.save(newRank);
          console.log(savedRank);
        } catch (error) {
          if (error.code === '23505') { // Unique constraint violation
            console.log('Rank already exists, skipping save.');
          } else {
            throw error;
          }
        }


      },
      // headless: false
    });

    await crawler.run(hrefs);
    console.log('Scraper has shut down.');
  }

  async scrapeAllWeapons() {
    const weapons = await this.weaponRepository.find();
    const weaponHrefs = weapons.map(weapon => weapon.href);
    await this.scrapeWeapon(weaponHrefs);
    console.log(weaponHrefs);
    console.log('Total weapons:', weapons.length);
  }

  async scrapeAllWeaponsDetail() {
    // const weapons = await this.weaponRepository.find();
    const weapons = await this.weaponRepository.createQueryBuilder('weapon')
      .leftJoinAndSelect('weapon.levelRanks', 'levelRank')
      .select(['weapon.id', 'weapon.name', 'weapon.href'])
      .addSelect('COUNT(levelRank.id)', 'rank_count')
      .groupBy('weapon.id')
      .addGroupBy('weapon.name')
      .addGroupBy('weapon.href')
      .orderBy('rank_count', 'ASC')
      .getMany();
    const weaponHrefs = weapons.map(weapon => weapon.href);
    // weaponHrefs = shuffle(weaponHrefs);
    await this.crawlDetail(weaponHrefs);
    console.log(weaponHrefs);
    console.log('Total weapons:', weapons);
  }

  async saveSkillToDatabase(skill: { name: string, value: string }): Promise<SkillEntity> {
    try {
      const existingSkill = await this.skillRepository.findOne({
        where: { name: skill.name, value: skill.value },
      });

      if (!existingSkill) {
        const newSkill = this.skillRepository.create({
          name: skill.name,
          value: skill.value,
        });
        console.log(newSkill);
        return await this.skillRepository.save(newSkill);
      }

      return existingSkill;
    } catch (error) {
      if (error.code === '23505') { // Unique constraint violation
        console.log('Skill already exists, skipping save.');
        return await this.skillRepository.findOne({
          where: { name: skill.name, value: skill.value },
        });
      } else {
        throw error;
      }
    }
  }


  async getItemsFromConsume(consume: any[]): Promise<{ items: ItemEntity[], costs: number[] }> {
    const names: string[] = [];
    const costs: number[] = [];
    for (const item of consume) {
      names.push(item.name);
      costs.push(parseInt(item.cost, 10));
    }
    const items = await this.itemRepository.find({
      where: { name: In(names) },
    });
    return { items, costs };
  }

  //endregion

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
