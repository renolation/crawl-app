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
}
