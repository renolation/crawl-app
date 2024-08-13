import {Injectable} from "@nestjs/common";
import {InjectRepository} from "@nestjs/typeorm";
import {CharacterEntity} from "./entities/character_entity";
import {Repository} from "typeorm";


@Injectable()
export class CharacterService {
    constructor(
        @InjectRepository(CharacterEntity)
        private characterEntityRepository: Repository<CharacterEntity>,
    ) {
    }
}