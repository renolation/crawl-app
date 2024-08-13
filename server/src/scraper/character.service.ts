import {Injectable} from "@nestjs/common";
import {InjectRepository} from "@nestjs/typeorm";
import {CharacterEntity} from "./entities/character_entity";
import {In, Repository} from "typeorm";
import {PlaywrightCrawler} from "@crawlee/playwright";
import {ItemEntity} from "./entities/item.entity";
import {CreateEchoMainStatDto} from "./dto/create-echo-main-stat.dto";
import {plainToInstance} from "class-transformer";
import {CreateCharacterTopStat} from "./dto/create-character-top-stat";
import {CharacterLevelEntity} from "./entities/character_level_entity";


@Injectable()
export class CharacterService {
    constructor(
        @InjectRepository(CharacterEntity)
        private characterEntityRepository: Repository<CharacterEntity>,

        @InjectRepository(ItemEntity)
        private itemRepository: Repository<ItemEntity>,
        @InjectRepository(CharacterLevelEntity)
        private characterLevelRepository: Repository<CharacterLevelEntity>,
    ) {
    }

    async getCharacterTopById() {
        const crawler = new PlaywrightCrawler({
            headless: false,
            requestHandlerTimeoutSecs: 36000,
            requestHandler: async ({page, request}) => {
                console.log(`Processing: ${request.url}`);
                await page.waitForSelector('section.character', {timeout: 10000});

                const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

                await page.evaluate(() => {
                    const slider = document.querySelector('section.character div.top div.right div.level div.slider-target.slider-ltr.slider-horizontal.slider-txt-dir-ltr div.slider-base') as HTMLElement;
                    if (slider) {
                        const currentWidth = slider.getBoundingClientRect().width;
                        slider.style.width = `${currentWidth * 3}px`;
                    }
                });
                const levelMinValue = 1;
                const levelMaxValue = 90;
                const sliderLevelTrack = page.locator('section.character div.top div.right div.level div.slider-target.slider-ltr.slider-horizontal.slider-txt-dir-ltr div.slider-base');
                const sliderLevelOffsetWidth = await sliderLevelTrack.evaluate(el => el.getBoundingClientRect().width);
                const sliderHandleWidth = await page.$eval('section.character div.top div.right div.level div.slider-target.slider-ltr.slider-horizontal.slider-txt-dir-ltr div.slider-base div.slider-origin div.slider-handle.slider-handle-lower', el => el.getBoundingClientRect().width);
                const correctedSliderLevelOffsetWidth = sliderLevelOffsetWidth - sliderHandleWidth;
                const positionsLevel = [];
                for (let valueLevel = levelMinValue; valueLevel <= levelMaxValue; valueLevel++) {
                    const positionXLevel = valueLevel === levelMaxValue
                        ? correctedSliderLevelOffsetWidth
                        : (correctedSliderLevelOffsetWidth / (levelMaxValue - levelMinValue)) * (valueLevel - levelMinValue);
                    positionsLevel.push(positionXLevel);
                }

                for (let i = 0; i < positionsLevel.length; i++) {
                    await sliderLevelTrack.click({force: true, position: {x: positionsLevel[i], y: 0}});
                    await sleep(500);
                    const currentLevelValue = await sliderLevelTrack.evaluate(el => {
                        const handle = el.querySelector('section.character div.top div.right div.level div.slider-target.slider-ltr.slider-horizontal.slider-txt-dir-ltr div.slider-base div.slider-origin div.slider-handle.slider-handle-lower');
                        return handle ? parseInt(handle.getAttribute('aria-valuenow'), 10) : null;
                    });
                    console.log('Current level:', currentLevelValue);

                    //region items
                    const consume = await page.$$eval('div.ascension ul.list li.consume', items =>
                        items.map(item => ({
                            name: item.querySelector('div.name')?.textContent.trim() || null,
                            cost: item.querySelector('div.cost')?.textContent.trim() || null,
                        })),
                    );
                    const consumeValue = await this.getItemsFromConsume(consume);
                    const itemIds = consumeValue.items;
                    const costs = consumeValue.costs;
                    console.log(itemIds);
                    console.log(costs);

                    //: ascension
                    const maxLevel = (await page.$eval('div.ascension div.top-h2 span', span => span.textContent.match(/Max Level: (\d+)/)[1])).trim();
                    console.log('Max Level:', maxLevel);

                    //endregion

                    //region top stat
                    const mainStat = await page.$$eval('section.character div.top div.right div.stats div.item', items => {
                        return items.map(item => {
                            const propElement = item as HTMLElement;
                            const nameElement = propElement.querySelector('div.text span') as HTMLElement;
                            const name = nameElement?.innerText.trim() || null;
                            const valElement = propElement.querySelector('div.value') as HTMLElement;
                            const value = valElement ? valElement.textContent.trim() : null;
                            return {name, value};
                        });
                    });
                    console.log('Props data: \n', mainStat);
                    const topStat = this.mapToEntity(mainStat);
                    console.log(topStat);
                    //endregion

                    //region save
                    const character = await this.characterEntityRepository.findOne({where: {href: request.url.replace('https://wuthering.gg', '')}});

                    try {
                        const existingLevel = await this.characterLevelRepository.findOne({
                            where: {
                                level: currentLevelValue,
                                character
                            }
                        });

                        if(!existingLevel){
                            const characterLevelEntity = new CharacterLevelEntity();
                            characterLevelEntity.level = currentLevelValue;
                            characterLevelEntity.hp = topStat.hp;
                            characterLevelEntity.atk = topStat.atk;
                            characterLevelEntity.def = topStat.def;
                            characterLevelEntity.crit_rate = topStat.crit_rate;
                            characterLevelEntity.crit_dmg = topStat.crit_dmg;
                            characterLevelEntity.energy_regen = topStat.energy_regen;
                            characterLevelEntity.max_resonance_energy = topStat.max_resonance_energy;
                            characterLevelEntity.items =itemIds;
                            characterLevelEntity.itemCounts = costs;
                            characterLevelEntity.ascension_max_level = parseInt(maxLevel, 10);

                            characterLevelEntity.character = character;
                            await this.characterLevelRepository.save(characterLevelEntity);
                        }



                    } catch (error){
                         if (error.code === '23505') { // Unique constraint violation
                                console.log('Echo Rank already exists, skipping save.');
                            } else {
                                throw error;
                            }
                    }
                    //endregion
                    await sleep(500);
                }
            },
        });
        await crawler.run(['https://wuthering.gg/characters/lingyang']);
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

    mapToEntity(data: { name: string, value: string }[]): CreateCharacterTopStat {
        const dtoObject = {};

        for (const item of data) {
            const key = this.toSnakeCase(item.name);
            dtoObject[key] = item.value;
        }
        return plainToInstance(CreateCharacterTopStat, dtoObject);
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

}