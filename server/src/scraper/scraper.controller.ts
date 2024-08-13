import {Controller, Get, Post, Body, Patch, Param, Delete} from '@nestjs/common';
import {ScraperService} from './scraper.service';
import {CreateScraperDto} from './dto/create-scraper.dto';
import {UpdateScraperDto} from './dto/update-scraper.dto';
import {CharacterService} from "./character.service";

@Controller('scraper')
export class ScraperController {
    constructor
    (private readonly scraperService: ScraperService,
     private readonly characterService: CharacterService,
    ) {
    }


    @Get('test')
    async test() {
        await this.scraperService.test2();
    }


    @Get('items')
    async items() {
        await this.scraperService.scrapeItems();
    }


    @Get('weapons')
    async weapons() {
        await this.scraperService.scrapeWeapons();
    }

    @Get('weapon')
    async weapon() {
        await this.scraperService.scrapeWeapon(['https://wuthering.gg/weapons/emerald-of-genesis']);
    }

    @Get('all-weapon')
    async allWeapon() {
        await this.scraperService.scrapeAllWeapons();
    }

    @Get('all-weapons-detail')
    async allWeaponsDetail() {
        await this.scraperService.scrapeAllWeaponsDetail();
    }

    @Get('elements')
    async elements() {
        await this.scraperService.scrapeElements();
    }

    @Get('echos')
    async echos() {
        await this.scraperService.scrapeEchos();
    }

    @Get('echo/sonata')
    async scrapeSonataEffect() {
        return await this.scraperService.scrapeSonataEffect();
    }

    @Get('echo/get')
    async getAllEchos() {
        return await this.scraperService.findAllEchos();
    }

    @Get('echo/get_sub_stat')
    async getSubStat() {
        return await this.scraperService.scrapeEchosHref();
    }


    @Get('echo/get_main_stat')
    async getMainStat() {
        // return await this.scraperService.scrapeEchoMainStat();
    }

    @Get('char/get_elements')
    async getElements() {
        return await this.scraperService.scrapeCharElements();
    }

    @Get('char/get_all')
    async getAll() {
        return await this.scraperService.scrapeCharacter();
    }

    @Get('char/get_info')
    async charGetInfo() {
        return await this.scraperService.scrapeAllCharacter();
    }

    @Get('char/top')
    async charTop() {
        return await this.characterService.getAllTopStats();
    }

    @Post()
    create(@Body() createScraperDto: CreateScraperDto) {
        return this.scraperService.create(createScraperDto);
    }

    @Get()
    findAll() {
        return this.scraperService.findAll();
    }

    @Get(':id')
    findOne(@Param('id') id: string) {
        return this.scraperService.findOne(+id);
    }

    @Patch(':id')
    update(@Param('id') id: string, @Body() updateScraperDto: UpdateScraperDto) {
        return this.scraperService.update(+id, updateScraperDto);
    }

    @Delete(':id')
    remove(@Param('id') id: string) {
        return this.scraperService.remove(+id);
    }
}
