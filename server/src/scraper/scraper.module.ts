import { Module } from '@nestjs/common';
import { ScraperService } from './scraper.service';
import { ScraperController } from './scraper.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Scraper } from './entities/scraper.entity';
import { ItemEntity } from './entities/item.entity';
import { WeaponEntity } from './entities/weapon.entity';
import { SkillEntity } from './entities/skill.entity';
import { WeaponLevelRank } from './entities/weapon_level_rank.entity';
import {SonataEffectEntity} from "./entities/sonata_effect.entity";
import {EchoEntity} from "./entities/echo.entity";
import {EchoSubStatEntity} from "./entities/echo_sub_stat.entity";
import {CharElementEntity} from "./entities/char_element.entity";
import {CharacterEntity} from "./entities/character_entity";
import {EchoMainStatEntity} from "./entities/echo_main_stat.entity";

@Module({
  imports: [TypeOrmModule.forFeature([Scraper, ItemEntity, WeaponEntity, SkillEntity, WeaponLevelRank,
   SonataEffectEntity, EchoEntity, EchoSubStatEntity, EchoMainStatEntity,
  CharElementEntity, CharacterEntity])],
  controllers: [ScraperController],
  providers: [ScraperService],
  exports: [ScraperService],
})
export class ScraperModule {
}
