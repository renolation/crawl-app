import { Module } from '@nestjs/common';
import { ScraperService } from './scraper.service';
import { ScraperController } from './scraper.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Scraper } from './entities/scraper.entity';
import { ItemEntity } from './entities/item.entity';
import { WeaponEntity } from './entities/weapon.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Scraper, ItemEntity, WeaponEntity])],
  controllers: [ScraperController],
  providers: [ScraperService],
  exports: [ScraperService],
})
export class ScraperModule {
}
