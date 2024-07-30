import { Module } from '@nestjs/common';
import { ScraperService } from './scraper.service';
import { ScraperController } from './scraper.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Scraper } from './entities/scraper.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Scraper])],
  controllers: [ScraperController],
  providers: [ScraperService],
  exports: [ScraperService],
})
export class ScraperModule {
}
