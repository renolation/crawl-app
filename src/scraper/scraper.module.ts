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

@Module({
  imports: [TypeOrmModule.forFeature([Scraper, ItemEntity, WeaponEntity, SkillEntity, WeaponLevelRank,
   SonataEffectEntity, EchoEntity])],
  controllers: [ScraperController],
  providers: [ScraperService],
  exports: [ScraperService],
})
export class ScraperModule {
}
