import {Injectable} from '@nestjs/common';
import {CreateGetterDto} from './dto/create-getter.dto';
import {UpdateGetterDto} from './dto/update-getter.dto';
import {InjectRepository} from "@nestjs/typeorm";
import {CharacterEntity} from "../scraper/entities/character_entity";
import {Repository} from "typeorm";
import {EchoEntity} from "../scraper/entities/echo.entity";
import {WeaponEntity} from "../scraper/entities/weapon.entity";
import {ItemEntity} from "../scraper/entities/item.entity";
import {CharElementEntity} from "../scraper/entities/char_element.entity";
import {SonataEffectEntity} from "../scraper/entities/sonata_effect.entity";
import {CharacterLevelEntity} from "../scraper/entities/character_level_entity";

@Injectable()
export class GetterService {

    constructor(
        @InjectRepository(CharacterEntity)
        private characterRepository: Repository<CharacterEntity>,
        @InjectRepository(EchoEntity)
        private echoRepository: Repository<EchoEntity>,
        @InjectRepository(WeaponEntity)
        private weaponRepository: Repository<WeaponEntity>,
        @InjectRepository(ItemEntity)
        private itemRepository: Repository<ItemEntity>,
        @InjectRepository(CharElementEntity)
        private charElementRepository: Repository<CharElementEntity>,
        @InjectRepository(SonataEffectEntity)
        private sonataEffectRepository: Repository<SonataEffectEntity>,
        @InjectRepository(CharacterLevelEntity)
        private characterLevelRepository: Repository<CharacterLevelEntity>,
    ) {
    }


    create(createGetterDto: CreateGetterDto) {
        return 'This action adds a new getter';
    }

    async findAllCharacters() {
        return await this.characterRepository.find(
            {
                relations: ['characterElement'],
                select: {
                    characterElement: {
                        name: true, imageUrl: true
                    }
                }

            }
        );
    }

    async findAllEchos() {
        return await this.echoRepository.find(
            {
                relations: ['sonataEffects']
            }
        );
    }

    async findAllCharacterElements() {
        return await this.charElementRepository.find(
        );
    }

    async findAllWeapons() {
        return await this.weaponRepository.find();
    }

    async findAllItems() {
        return await this.itemRepository.find();
    }

    async getEchoById(id: number) {
        const echo = await this.echoRepository.findOne({
            where: {id},
            relations: ['levelRanks', 'levelRanks.echoMainStatEntity', 'echoSubStat', 'echoAbility', 'sonataEffects'],
        });

        if (!echo) {
            throw new Error(`Echo with id ${id} not found`);
        }


        return {
            ...echo,

        };
    }

    async getWeaponById(id: number) {
        const item = await this.weaponRepository.findOne({
            where: {id},
            relations: ['levelRanks', 'levelRanks.items', 'levelRanks.skills'],
            select: {
                levelRanks: {
                    id: true,
                    level: true,
                    rank: true,
                    stat1_name: true,
                    stat1_value: true,
                    stat2_name: true,
                    stat2_value: true,
                    ascension_max_level: true,
                    about: true,
                    items: {
                        id: true,
                        name: true,
                        rank: true,
                        imageUrl: true,
                    },
                    itemCounts: true,
                    skills: {
                        id: true,
                        name: true,
                        value: true,

                    }
                }
            }
        });

        if (!item) {
            throw new Error(`Echo with id ${id} not found`);
        }


        return {
            ...item,
        };
    }

    async getCharacterById(id: number) {
        return this.characterRepository.findOne({
            where: {id},
            relations: ['levels', 'levels.items', 'characterElement'],
        });
    }

    findAll() {
        return `This action returns all getter`;
    }

    findOne(id: number) {
        return `This action returns a #${id} getter`;
    }

    update(id: number, updateGetterDto: UpdateGetterDto) {
        return `This action updates a #${id} getter`;
    }

    remove(id: number) {
        return `This action removes a #${id} getter`;
    }

    async findSonata() {
        return await this.sonataEffectRepository.find();
    }


}
