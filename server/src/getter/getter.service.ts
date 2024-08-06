import {Injectable} from '@nestjs/common';
import {CreateGetterDto} from './dto/create-getter.dto';
import {UpdateGetterDto} from './dto/update-getter.dto';
import {InjectRepository} from "@nestjs/typeorm";
import {CharacterEntity} from "../scraper/entities/character_entity";
import {Repository} from "typeorm";
import {EchoEntity} from "../scraper/entities/echo.entity";

@Injectable()
export class GetterService {

    constructor(
        @InjectRepository(CharacterEntity)
        private characterRepository: Repository<CharacterEntity>,
        @InjectRepository(EchoEntity)
        private echoRepository: Repository<EchoEntity>
    ) {
    }


    create(createGetterDto: CreateGetterDto) {
        return 'This action adds a new getter';
    }

    async findAllCharacters() {
        return await this.characterRepository.find(
            {
                relations: ['characterElement']
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
