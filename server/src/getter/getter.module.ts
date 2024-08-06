import { Module } from '@nestjs/common';
import { GetterService } from './getter.service';
import { GetterController } from './getter.controller';
import {ScraperModule} from "../scraper/scraper.module";
import {TypeOrmModule} from "@nestjs/typeorm";
import {CharacterEntity} from "../scraper/entities/character_entity";
import {CharElementEntity} from "../scraper/entities/char_element.entity";
import {EchoEntity} from "../scraper/entities/echo.entity";
import {EchoSubStatEntity} from "../scraper/entities/echo_sub_stat.entity";
import {SonataEffectEntity} from "../scraper/entities/sonata_effect.entity";
import {WeaponEntity} from "../scraper/entities/weapon.entity";
import {ItemEntity} from "../scraper/entities/item.entity";

@Module({
  imports: [TypeOrmModule.forFeature([CharacterEntity, CharElementEntity, EchoEntity, EchoSubStatEntity, SonataEffectEntity, WeaponEntity, ItemEntity])],
  controllers: [GetterController],
  providers: [GetterService],
  exports: [GetterService]

})
export class GetterModule {}
