import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ScraperService } from './scraper.service';
import { CreateScraperDto } from './dto/create-scraper.dto';
import { UpdateScraperDto } from './dto/update-scraper.dto';

@Controller('scraper')
export class ScraperController {
  constructor(private readonly scraperService: ScraperService) {
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
    await this.scraperService.scrapeWeapon('https://wuthering.gg/weapons/emerald-of-genesis');
  }

  @Get('elements')
  async elements() {
    await this.scraperService.scrapeElements();
  }

  @Get('echos')
  async echos() {
    await this.scraperService.scrapeEchos();
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
