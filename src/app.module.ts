import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ScraperModule } from './scraper/scraper.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Scraper } from './scraper/entities/scraper.entity';
import { ItemEntity } from './scraper/entities/item.entity';
import { WeaponEntity } from './scraper/entities/weapon.entity';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: '103.188.82.191',
      port: 32768,
      username: 'root',
      password: 'password',
      database: 'postgres',
      entities: [Scraper, ItemEntity, WeaponEntity],
      synchronize: true,
    }),
     ScraperModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
