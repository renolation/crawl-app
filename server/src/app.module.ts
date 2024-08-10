import {Module} from '@nestjs/common';
import {AppController} from './app.controller';
import {AppService} from './app.service';
import {ScraperModule} from './scraper/scraper.module';
import {TypeOrmModule} from '@nestjs/typeorm';
import {Scraper} from './scraper/entities/scraper.entity';
import {ItemEntity} from './scraper/entities/item.entity';
import {WeaponEntity} from './scraper/entities/weapon.entity';
import {SkillEntity} from './scraper/entities/skill.entity';
import {WeaponLevelRank} from './scraper/entities/weapon_level_rank.entity';
import {SonataEffectEntity} from "./scraper/entities/sonata_effect.entity";
import {EchoEntity} from "./scraper/entities/echo.entity";
import {EchoSubStatEntity} from "./scraper/entities/echo_sub_stat.entity";
import {CharElementEntity} from "./scraper/entities/char_element.entity";
import {CharacterEntity} from "./scraper/entities/character_entity";
import {GetterModule} from './getter/getter.module';
import {EchoMainStatEntity} from "./scraper/entities/echo_main_stat.entity";
import {EchoAbilityEntity} from "./scraper/entities/echo_ability.entity";
import {EchoLevelRank} from "./scraper/entities/echo_level_rank.entity";
import {UploadModule} from "./upload/upload.module";

@Module({
    imports: [
        TypeOrmModule.forRoot({
            type: 'postgres',
            host: '103.188.82.191',
            port: 32768,
            username: 'root',
            password: 'password',
            database: 'postgres',
            entities: [Scraper, ItemEntity, WeaponEntity, SkillEntity, WeaponLevelRank,
                SonataEffectEntity, EchoEntity, EchoSubStatEntity, EchoMainStatEntity, EchoAbilityEntity, EchoLevelRank,
                CharElementEntity, CharacterEntity],
            synchronize: true,
        }),
        ScraperModule,
        GetterModule,
        UploadModule],
    controllers: [AppController],
    providers: [AppService],
})
export class AppModule {
}
