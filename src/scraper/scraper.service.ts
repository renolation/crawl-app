import { Injectable } from '@nestjs/common';
import { CreateScraperDto } from './dto/create-scraper.dto';
import { UpdateScraperDto } from './dto/update-scraper.dto';

import { PlaywrightCrawler, Dataset, log } from '@crawlee/playwright';
import { Scraper } from './entities/scraper.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Injectable()
export class ScraperService {

  constructor(
    @InjectRepository(Scraper)
    private scraperRepository: Repository<Scraper>,
  ) {
  }

  //region default
  create(createScraperDto: CreateScraperDto) {
    return 'This action adds a new scraper';
  }

  findAll() {
    return `This action returns all scraper`;
  }

  findOne(id: number) {
    return `This action returns a #${id} scraper`;
  }

  update(id: number, updateScraperDto: UpdateScraperDto) {
    return `This action updates a #${id} scraper`;
  }

  remove(id: number) {
    return `This action removes a #${id} scraper`;
  }

  //endregion


  async scrapeItems() {
    const crawler = new PlaywrightCrawler({
      requestHandler: async ({ page, request, enqueueLinks }) => {
        console.log(`Processing: ${request.url}`);

        const urlObj = new URL(request.url);
        const domain = urlObj.origin;
        console.log(`Domain: ${domain}`);

        await enqueueLinks({
          selector: '.types .type:not(:first-child)',
          baseUrl: domain,
        });

        if (!request.loadedUrl.endsWith('/items')) {
          try {
            await page.waitForSelector('table.items-table tr', { timeout: 5000 });

            const rowCount = await page.$$eval('table.items-table tr', rows => {
              return rows.slice(1).map(row => {
                const cells = row.querySelectorAll('td');
                const imageElement = cells[0]?.querySelector('img');
                const nameElement = cells[1]?.querySelector('div.name.quality3');
                const subtypesElement = cells[1]?.querySelector('div.subtypes');
                const descriptionElement = cells[2];

                if (!imageElement || !nameElement || !subtypesElement || !descriptionElement) {
                  console.error('Missing element:', { imageElement, nameElement, subtypesElement, descriptionElement });
                  return null;
                }

                const imageSrc = imageElement.src;
                const name = nameElement.textContent.trim();
                const subtypes = subtypesElement.textContent.trim();
                const description = descriptionElement.textContent.trim();
                const rankMatch = nameElement.className.match(/quality(\d)/);
                const rank = rankMatch ? parseInt(rankMatch[1], 10) : null;
                console.log(name + ' ' + subtypes + ' ' + description + ' ' + rank);

                return {
                  imageSrc,
                  name,
                  subtypes,
                  description,
                  rank,
                };
              }).filter(item => item !== null); // Filter out null items
            });
            console.log(`Data extracted from ${request.loadedUrl}:`, rowCount);
          } catch (error) {
            log.error(`Error processing ${request.loadedUrl}: ${error.message}`);
          }
        }
      },
      headless: false,
    });
    await crawler.run(['https://wuthering.gg/items/']);
  }
}
