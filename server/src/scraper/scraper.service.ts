import {Injectable} from '@nestjs/common';
import {CreateScraperDto} from './dto/create-scraper.dto';
import {UpdateScraperDto} from './dto/update-scraper.dto';
import {shuffle} from 'lodash';

import {log, PlaywrightCrawler} from '@crawlee/playwright';
import {Scraper} from './entities/scraper.entity';
import {InjectRepository} from '@nestjs/typeorm';
import {In, Repository} from 'typeorm';
import {ItemEntity} from './entities/item.entity';
import {WeaponEntity} from './entities/weapon.entity';
import {WeaponLevelRank} from './entities/weapon_level_rank.entity';
import {SkillEntity} from './entities/skill.entity';
import {SonataEffectEntity} from "./entities/sonata_effect.entity";
import {EchoEntity} from "./entities/echo.entity";
import {EchoSubStatEntity} from "./entities/echo_sub_stat.entity";
import {CharElementEntity} from "./entities/char_element.entity";
import {CharacterEntity} from "./entities/character_entity";
import {EchoMainStatEntity} from "./entities/echo_main_stat.entity";
import {EchoAbilityEntity} from "./entities/echo_ability.entity";
import {EchoLevelRank} from "./entities/echo_level_rank.entity";
import {CreateEchoMainStatDto} from "./dto/create-echo-main-stat.dto";
import {plainToClass, plainToInstance} from "class-transformer";


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
        @InjectRepository(SonataEffectEntity)
        private sonataEffectRepository: Repository<SonataEffectEntity>,
        @InjectRepository(EchoEntity)
        private echoRepository: Repository<EchoEntity>,
        @InjectRepository(EchoSubStatEntity)
        private echoSubStatRepository: Repository<EchoSubStatEntity>,
        @InjectRepository(CharElementEntity)
        private charElementRepository: Repository<CharElementEntity>,
        @InjectRepository(CharacterEntity)
        private characterRepository: Repository<CharacterEntity>,
        @InjectRepository(EchoMainStatEntity)
        private echoMainStatRepository: Repository<EchoMainStatEntity>,
        @InjectRepository(EchoAbilityEntity)
        private echoAbilityRepository: Repository<EchoAbilityEntity>,
        @InjectRepository(EchoLevelRank)
        private echoLevelRankRepository: Repository<EchoLevelRank>,
    ) {
    }

    //region default
    create(createScraperDto: CreateScraperDto) {
        return 'This action adds a new scraper';
    }

    async findAllEchos() {
        return await this.echoRepository.find({
            relations: ['sonataEffects'],
            select: {
                sonataEffects: {
                    name: true, imageUrl: true, index: true
                }
            }
        });
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
        const map = [
            {name: 'ATK\nDefault', value: '12'},
            {name: 'ATK\n%', value: '3.8%'},
            {name: 'HP\n%', value: '3.8%'},
            {name: 'DEF\n%', value: '4.8%'},
            {name: 'Glacio DMG Bonus', value: '3.8%'},
            {name: 'Fusion DMG Bonus', value: '3.8%'},
            {name: 'Electro DMG Bonus', value: '3.8%'},
            {name: 'Aero DMG Bonus', value: '3.8%'},
            {name: 'Spectro DMG Bonus', value: '3.8%'},
            {name: 'Havoc DMG Bonus', value: '3.8%'},
            {name: 'Energy Regen', value: '4.0%'}
        ];
        const entity = this.mapToEntity(map);
        console.log('Entity:', entity);
    }

    async crawlDetail(hrefs: string[]) {
        const crawler = new PlaywrightCrawler({
            // headless: false,
            requestHandlerTimeoutSecs: 36000,
            maxConcurrency: 1,

            requestHandler: async ({page, request}) => {

                await page.route('**/*', (route) => {
                    const request = route.request();
                    if (request.resourceType() === 'image') {
                        route.abort();
                    } else {
                        route.continue();
                    }
                });

                const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));
                await page.waitForSelector('.slider-handle-lower', {timeout: 1000});
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
                    await sliderLevelTrack.click({force: true, position: {x: positionsLevel[i], y: 0}});
                    await sleep(1000);
                    const currentLevelValue = await sliderLevelTrack.evaluate(el => {
                        const handle = el.querySelector('.slider-handle-lower');
                        return handle ? parseInt(handle.getAttribute('aria-valuenow'), 10) : null;
                    });
                    for (let j = 0; j < positionsRank.length; j++) {
                        await sliderRankTrack.click({force: true, position: {x: positionsRank[j], y: 0}});
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

                        const weapon = await this.weaponRepository.findOne({where: {href: request.url}});
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
            requestHandler: async ({page, request, enqueueLinks}) => {
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
                        await page.waitForSelector('table.items-table tr', {timeout: 10000});
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
                where: {name: item.name},
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
        return await this.itemRepository.findOne({where: {name}});
    }

    //endregion
    //region weapon
    async scrapeWeapons() {
        const crawler = new PlaywrightCrawler({
            requestHandler: async ({page, request}) => {
                console.log(`Processing: ${request.url}`);

                const urlObj = new URL(request.url);
                const domain = urlObj.origin;
                console.log(`Domain: ${domain}`);

                await page.waitForSelector('select#weapon-type', {timeout: 10000});
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
                    await page.waitForSelector('ul.weapons > li a.weapon', {timeout: 10000});

                    const weaponData = await page.$$eval('ul.weapons > li a.weapon', items => {
                        return items.map(item => {
                            const anchor = item as HTMLAnchorElement;
                            const img = anchor.querySelector('div.image img') as HTMLImageElement;
                            const nameElement = anchor.querySelector('div.name');

                            if (!anchor || !img || !nameElement) {
                                console.error('Missing element:', {anchor, img, nameElement});
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
                where: {name: weapon.name, href: weapon.href},
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
            requestHandler: async ({page, request, enqueueLinks}) => {
                console.log(`Processing: ${request.url}`);

                await page.waitForSelector('div.stats.head div.item', {timeout: 10000});

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

                const weapon = await this.weaponRepository.findOne({where: {href: request.url}});
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
                where: {name: skill.name, value: skill.value},
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
                    where: {name: skill.name, value: skill.value},
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
            where: {name: In(names)},
        });
        return {items, costs};
    }

    //endregion

    async scrapeElements() {
        const crawler = new PlaywrightCrawler({
            requestHandler: async ({page, request}) => {
                console.log(`Processing: ${request.url}`);
                await page.waitForSelector('div.elements', {timeout: 10000});

                const buttons = await page.$$eval('div.elements button', buttons => {
                    return buttons.map(button => {
                        const buttonElement = button as HTMLButtonElement;

                        const imgElement = buttonElement.querySelector('img') as HTMLImageElement;
                        if (!imgElement) {
                            console.error('Missing img element:', {buttonElement});
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
            requestHandler: async ({page, request}) => {
                console.log(`Processing: ${request.url}`);
                await page.waitForSelector('div.elements', {timeout: 20000});
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
                await this.saveEchosToDatabase(items);
            },

        });
        await crawler.run(['https://wuthering.gg/echos/']);

    }

    async saveEchosToDatabase(itemsData: {
        href: string,
        name: string,
        imgSrc: string,
        cost: number,
        fetters: number[]
    }[]) {
        for (const itemData of itemsData) {
            const existingEcho = await this.echoRepository.findOne({
                where: {name: itemData.name, href: itemData.href},
                relations: ['sonataEffects'],
            });

            const sonataEffects = await this.sonataEffectRepository.find({
                where: {index: In(itemData.fetters)},
            })

            if (!existingEcho) {
                const newEcho = this.echoRepository.create({
                    name: itemData.name,
                    imageUrl: itemData.imgSrc,
                    href: itemData.href,
                    cost: itemData.cost,
                    sonataEffects: sonataEffects,
                });
                await this.echoRepository.save(newEcho);
                console.log('Echo saved to database:', newEcho);
            } else {
                existingEcho.sonataEffects = sonataEffects;
                await this.echoRepository.save(existingEcho);
                console.log('Echo updated in database:', existingEcho);
            }
        }
    }

    async scrapeSonataEffect() {
        const crawler = new PlaywrightCrawler({
            requestHandler: async ({page, request}) => {
                console.log(`Processing: ${request.url}`);
                const buttonsData = await page.$$eval('div.elements button', buttons => {

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

                    return buttons.map(button => {
                        const buttonElement = button as HTMLButtonElement;
                        const className = buttonElement.className;
                        const index = className.match(/f(\d+)/) ? parseInt(className.match(/f(\d+)/)[1], 10) : null;
                        const imgElement = buttonElement.querySelector('img') as HTMLImageElement;
                        const name = imgElement.alt;
                        const srcset = getImageSrc(imgElement);
                        return {
                            index,
                            name,
                            srcset
                        };
                    });
                });

                console.log('Buttons data:', buttonsData);
                await this.saveSonataEffectsToDatabase(buttonsData);
            },
            // headless: false
        });
        await crawler.run(['https://wuthering.gg/echos/']);
    }

    async saveSonataEffectsToDatabase(buttonsData: { index: number, name: string, srcset: string }[]) {
        for (const buttonData of buttonsData) {
            const existingSonataEffect = await this.sonataEffectRepository.findOne({
                where: {name: buttonData.name, index: buttonData.index},
            });

            if (!existingSonataEffect) {
                const newSonataEffect = this.sonataEffectRepository.create({
                    name: buttonData.name,
                    imageUrl: buttonData.srcset,
                    index: buttonData.index,
                });
                await this.sonataEffectRepository.save(newSonataEffect);
                console.log('Sonata Effect saved to database:', newSonataEffect);
            } else {
                console.log('Sonata Effect already exists:', existingSonataEffect);
            }
        }
    }


    async scrapeEchosHref() {
        const echos = await this.echoRepository.find();
        const echosHrefs = echos.map(echo => 'https://wuthering.gg' + echo.href);
        console.log(echosHrefs);
        console.log('Total weapons:', echos.length);
        await this.scrapeEchoSubStat(echosHrefs);
        return echosHrefs;
    }

    async scrapeEchoSubStat(hrefs: string[]) {
        const crawler = new PlaywrightCrawler({
            requestHandlerTimeoutSecs: 1800,
            requestHandler: async ({page, request}) => {
                const subStat = await page.$$eval('div.props.sub div.list div.prop', items => {
                    return items.map(item => {
                        const propElement = item as HTMLElement;
                        const valElement = propElement.querySelector('div.val') as HTMLElement;
                        const value = valElement ? valElement.textContent.trim() : null;
                        return {value};
                    });
                });
                console.log('Props data: \n', subStat);
                const subStatObject = {
                    hp: subStat[0]?.value || '',
                    atk: subStat[1]?.value || '',
                    def: subStat[2]?.value || '',
                    hp_percent: subStat[3]?.value || '',
                    atk_percent: subStat[4]?.value || '',
                    def_percent: subStat[5]?.value || '',
                    crit_rate: subStat[6]?.value || '',
                    crit_dmg: subStat[7]?.value || '',
                    energy_regen: subStat[8]?.value || '',
                    resonance_skill_dmg_bonus: subStat[9]?.value || '',
                    basic_atk_dmg_bonus: subStat[10]?.value || '',
                    heavy_atk_dmg_bonus: subStat[11]?.value || '',
                    resonance_liberation_dmg_bonus: subStat[12]?.value || ''
                };
                await this.saveEchoSubStatToDatabase(request.url.replace('https://wuthering.gg', ''), subStatObject);


            }
        });
        await crawler.run(hrefs);
    }


    async saveEchoSubStatToDatabase(echoUrl: string, subStat: {
        hp: string,
        atk: string,
        def: string,
        hp_percent: string,
        atk_percent: string,
        def_percent: string,
        crit_rate: string,
        crit_dmg: string,
        energy_regen: string,
        resonance_skill_dmg_bonus: string,
        basic_atk_dmg_bonus: string,
        heavy_atk_dmg_bonus: string,
        resonance_liberation_dmg_bonus: string
    }): Promise<EchoSubStatEntity> {

        const echo = await this.echoRepository.findOne({where: {href: echoUrl}});

        const existSubStat = await this.echoSubStatRepository.findOne({
            where: {
                hp: subStat.hp,
                atk: subStat.atk,
                def: subStat.def,
            },

        });
        if (!existSubStat) {
            const newSubStat = this.echoSubStatRepository.create({
                hp: subStat.hp,
                atk: subStat.atk,
                def: subStat.def,
                hp_percent: subStat.hp_percent,
                atk_percent: subStat.atk_percent,
                def_percent: subStat.def_percent,
                crit_rate: subStat.crit_rate,
                crit_dmg: subStat.crit_dmg,
                energy_regen: subStat.energy_regen,
                resonance_skill_dmg_bonus: subStat.resonance_skill_dmg_bonus,
                basic_atk_dmg_bonus: subStat.basic_atk_dmg_bonus,
                heavy_atk_dmg_bonus: subStat.heavy_atk_dmg_bonus,
                resonance_liberation_dmg_bonus: subStat.resonance_liberation_dmg_bonus,
                echoes: [echo]
            });
            await this.echoSubStatRepository.save(newSubStat);
            console.log('SubStat saved to database:', newSubStat);
            return newSubStat;
        } else {
            echo.echoSubStat = existSubStat;
            await this.echoRepository.save(echo);
            await this.echoSubStatRepository.save(existSubStat);
            return existSubStat;
        }
    }

    async scrapeCharElements() {
        const crawler = new PlaywrightCrawler({
            requestHandler: async ({page, request}) => {
                console.log(`Processing: ${request.url}`);
                const buttonsData = await page.$$eval('div.elements button', buttons => {

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

                    return buttons.map(button => {
                        const buttonElement = button as HTMLButtonElement;

                        const imgElement = buttonElement.querySelector('img') as HTMLImageElement;
                        const name = imgElement.alt;
                        const srcset = getImageSrc(imgElement);
                        return {
                            name,
                            srcset
                        };
                    });
                });

                console.log('Buttons data:', buttonsData);
                await this.saveCharElementToDatabase(buttonsData);
            },
            // headless: false
        });
        await crawler.run(['https://wuthering.gg/characters/']);
    }

    async saveCharElementToDatabase(elementsData: { name: string, srcset: string }[]) {
        for (const element of elementsData) {
            const existingElement = await this.charElementRepository.findOne({
                where: {name: element.name, imageUrl: element.srcset},
            });

            if (!existingElement) {
                const charElementEntity = this.charElementRepository.create({
                    name: element.name,
                    imageUrl: element.srcset,

                });
                await this.charElementRepository.save(charElementEntity);
                console.log('Sonata Effect saved to database:', charElementEntity);
            } else {
                console.log('Sonata Effect already exists:', existingElement);
            }
        }
    }

    async scrapeCharacter() {
        const crawler = new PlaywrightCrawler({
            requestHandler: async ({page, request}) => {
                console.log(`Processing: ${request.url}`);
                await page.waitForSelector('div.elements', {timeout: 20000});
                const items = await page.$$eval('ul.list li.item', items => {
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


                        const element = itemElement.querySelector('div.elm');
                        const elementAlt = element.querySelector('img').alt;


                        return {
                            href,
                            imgSrc,
                            name,
                            elementAlt,
                        };
                    }); // Filter out null items
                });
                //: todo: save it to the database
                console.log('List of buttons:', items);
                await this.saveCharToDatabase(items);
            },

        });
        await crawler.run(['https://wuthering.gg/characters']);

    }

    async saveCharToDatabase(itemsData: {
        href: string,
        name: string,
        imgSrc: string,
        elementAlt: string,
    }[]) {
        for (const itemData of itemsData) {
            const existingChar = await this.characterRepository.findOne({
                where: {name: itemData.name, href: itemData.href},
                relations: ['characterElement'],
            });

            const charElement = await this.charElementRepository.findOne({where: {name: itemData.elementAlt}});

            if (!existingChar) {
                const newChar = this.characterRepository.create({
                    name: itemData.name,
                    imageUrl: itemData.imgSrc,
                    href: itemData.href,
                    characterElement: charElement,
                });
                await this.characterRepository.save(newChar);
                console.log('Echo saved to database:', newChar);
            } else {
                console.log('Echo already exists:', existingChar);
            }
        }
    }

    async scrapeEchoMainStat() {


        const crawler = new PlaywrightCrawler({
            requestHandlerTimeoutSecs: 1800,
            // headless: false,
            requestHandler: async ({page, request}) => {

                await page.waitForSelector('.slider-handle-lower', {timeout: 1000});
                await page.waitForTimeout(1000);
                const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

                // Get the current width of the slider element and multiply it by 3
                await page.evaluate(() => {
                    const slider = document.querySelector('.slider-base') as HTMLElement;
                    if (slider) {
                        const currentWidth = slider.getBoundingClientRect().width;
                        slider.style.width = `${currentWidth * 15}px`;
                    }
                });

                // //region slider
                const rankMinValue = 2;
                const rankMaxValue = 5;

                const levelMinValue = 0;
                const levelMaxValue = 25;

                const sliderRankTrack = page.locator('.slider-base').nth(0);
                const sliderLevelTrack = page.locator('.slider-base').nth(1);

                const sliderRankOffsetWidth = await sliderRankTrack.evaluate(el => el.getBoundingClientRect().width);
                const sliderLevelOffsetWidth = await sliderLevelTrack.evaluate(el => el.getBoundingClientRect().width);
                const sliderHandleWidth = await page.$eval('.slider-handle-lower', el => el.getBoundingClientRect().width);
                const correctedSliderRankOffsetWidth = sliderRankOffsetWidth - sliderHandleWidth;
                const correctedSliderLevelOffsetWidth = sliderLevelOffsetWidth - sliderHandleWidth;
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
                    await sliderLevelTrack.click({force: true, position: {x: positionsLevel[i], y: 0}});
                    await sleep(1000);
                    const currentLevelValue = await sliderLevelTrack.evaluate(el => {
                        const handle = el.querySelector('.slider-handle-lower');
                        return handle ? parseInt(handle.getAttribute('aria-valuenow'), 10) : null;
                    });
                    for (let j = 0; j < positionsRank.length; j++) {
                        await sliderRankTrack.click({force: true, position: {x: positionsRank[j], y: 0}});
                        await sleep(1000);
                        const currentRankValue = await sliderRankTrack.evaluate(el => {
                            const handle = el.querySelector('.slider-handle-lower');
                            return handle ? parseInt(handle.getAttribute('aria-valuenow'), 10) : null;
                        });
                        console.log('Level:', currentLevelValue);
                        console.log('Rank:', currentRankValue);
                        //region mainStat

                        const mainStat = await page.$$eval('div.props.main div.list div.prop', items => {
                            return items.map(item => {
                                const propElement = item as HTMLElement;
                                const nameElement = propElement.querySelector('div.name') as HTMLElement;
                                const name = nameElement ? nameElement.innerText.trim() : null;
                                const valElement = propElement.querySelector('div.val') as HTMLElement;
                                const value = valElement ? valElement.textContent.trim() : null;
                                return {name, value};
                            });
                        });
                        // console.log('Props data: \n', mainStat);
                        const entity = this.mapToEntity(mainStat);
                        // console.log('Entity:', entity);
                        const mainStatEntity = await this.saveMainStatToDatabase(entity);
                        //endregion

                        //region get ability
                        const imageSrc = (await page.$eval('div.ability div.name img', (img: HTMLImageElement) => img.src)).trim();
                        const rank = (await page.$eval('div.ability div.rank', (element: HTMLElement) => element.textContent.trim())).replace('Rank ', '');
                        const abilityDetail = (await page.$eval('div.ability div.container p', p => p.innerHTML.trim())).trim();
                        const echoAbility = await this.saveAbilityToDatabase(imageSrc, parseInt(rank, 10), abilityDetail);
                        //endregion

                        //region save to db
                        const echo = await this.echoRepository.findOne({where: {href: request.url.replace('https://wuthering.gg', '')}});

                        try {
                            const newRank = this.echoLevelRankRepository.create({
                                rank: currentRankValue,
                                level: currentLevelValue,
                                echo: echo,
                                echoMainStatEntities: [mainStatEntity],
                                echo_ability: [echoAbility]
                            });
                            const savedRank = await this.echoLevelRankRepository.save(newRank);
                            await sleep(100);
                        } catch (error) {
                            if (error.code === '23505') { // Unique constraint violation
                                console.log('Rank already exists, skipping save.');
                            } else {
                                throw error;
                            }
                        }
                        await sleep(1000);

                        //endregion
                    }
                }
                //  //endregion


            }
        });
        await crawler.run(['https://wuthering.gg/echos/flautist']);
    }

    toSnakeCase(str: string): string {
        if (str === 'ATK\nDefault') {
            return 'atk';
        }
        return str
            .replace(/([a-z])([A-Z])/g, '$1_$2') // Add underscore between lowercase and uppercase letters
            .replace(/\s+/g, '_') // Replace spaces with underscores
            .replace(/%/g, 'percent') // Replace '%' with 'percent'
            .replace(/\./g, '') // Remove '.'
            .toLowerCase();
    }


    mapToEntity(data: { name: string, value: string }[]): CreateEchoMainStatDto {
        const dtoObject = {};

        for (const item of data) {
            const key = this.toSnakeCase(item.name);
            dtoObject[key] = item.value;
        }
        return plainToInstance(CreateEchoMainStatDto, dtoObject);
    }

    async saveAbilityToDatabase(imageSrc: string, rank: number, abilityDetail: string) {
        const existingAbility = await this.echoAbilityRepository.findOne({
            where: {imageUrl: imageSrc, rank: rank, value: abilityDetail},
        });

        if (!existingAbility) {
            const newAbility = this.echoAbilityRepository.create({
                imageUrl: imageSrc,
                rank: rank,
                value: abilityDetail,
            });
            await this.echoAbilityRepository.save(newAbility);
            console.log('Ability saved to database:', newAbility);
            return newAbility;
        } else {
            console.log('Ability already exists:', existingAbility);
            return existingAbility;
        }
    }

    async saveMainStatToDatabase(mainStat: CreateEchoMainStatDto) {
        const existMainStat = await this.echoMainStatRepository.findOne({
            where: {
                atk: mainStat.atk,
                atk_percent: mainStat.atk_percent,

                hp: mainStat.hp,
                hp_percent: mainStat.hp_percent,

                def_percent: mainStat.def_percent,
                crit_rate: mainStat.crit_rate,
                crit_dmg: mainStat.crit_dmg,

                healing_bonus: mainStat.healing_bonus,
                glacio_dmg_bonus: mainStat.glacio_dmg_bonus,
                fusion_dmg_bonus: mainStat.fusion_dmg_bonus,
                electro_dmg_bonus: mainStat.electro_dmg_bonus,
                aero_dmg_bonus: mainStat.aero_dmg_bonus,
                spectro_dmg_bonus: mainStat.spectro_dmg_bonus,
                havoc_dmg_bonus: mainStat.havoc_dmg_bonus,
                energy_regen: mainStat.energy_regen,
            },
        });
        if (!existMainStat) {
            const newMainStat = this.echoMainStatRepository.create({
                atk: mainStat.atk,
                atk_percent: mainStat.atk_percent,
                hp: mainStat.hp,
                hp_percent: mainStat.hp_percent,
                def_percent: mainStat.def_percent,
                crit_rate: mainStat.crit_rate,
                crit_dmg: mainStat.crit_dmg,
                healing_bonus: mainStat.healing_bonus,
                glacio_dmg_bonus: mainStat.glacio_dmg_bonus,
                fusion_dmg_bonus: mainStat.fusion_dmg_bonus,
                electro_dmg_bonus: mainStat.electro_dmg_bonus,
                aero_dmg_bonus: mainStat.aero_dmg_bonus,
                spectro_dmg_bonus: mainStat.spectro_dmg_bonus,
                havoc_dmg_bonus: mainStat.havoc_dmg_bonus,
                energy_regen: mainStat.energy_regen,

            });
            await this.echoMainStatRepository.save(newMainStat);
            console.log('MainStat saved to database:', newMainStat);
            return newMainStat;
        } else {
            return existMainStat;
        }
    }
}
