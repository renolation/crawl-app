import {Controller, Get, Post, Body, Patch, Param, Delete} from '@nestjs/common';
import {GetterService} from './getter.service';
import {CreateGetterDto} from './dto/create-getter.dto';
import {UpdateGetterDto} from './dto/update-getter.dto';

@Controller('getter')
export class GetterController {
    constructor(private readonly getterService: GetterService) {
    }

    @Post()
    create(@Body() createGetterDto: CreateGetterDto) {
        return this.getterService.create(createGetterDto);
    }

    @Get()
    findAll() {
        return this.getterService.findAll();
    }

    @Get('list-sonata')
    async listSonata() {
        return await this.getterService.findSonata();
    }

    @Get('list-characters')
    listCharacters() {
        return this.getterService.findAllCharacters();
    }

    @Get('list-character-elements')
    listCharacterElements() {
        return this.getterService.findAllCharacterElements();
    }

    @Get('list-echos')
    listEchos() {
        return this.getterService.findAllEchos();
    }

    @Get('list-weapons')
    listWeapons() {
        return this.getterService.findAllWeapons();
    }

    @Get('list-items')
    listItems() {
        return this.getterService.findAllItems();
    }

    @Get('weapon/:id')
    async getWeaponById(@Param('id') id: number) {
        return this.getterService.getWeaponById(id);
    }

    @Get('echo/:id')
    async getEchoById(@Param('id') id: number) {
        return this.getterService.getEchoById(id);
    }

    @Get('character/:id')
    async getCharacterById(@Param('id') id: number) {
        return this.getterService.getCharacterById(id);
    }

    @Get(':id')
    findOne(@Param('id') id: string) {
        return this.getterService.findOne(+id);
    }

    @Patch(':id')
    update(@Param('id') id: string, @Body() updateGetterDto: UpdateGetterDto) {
        return this.getterService.update(+id, updateGetterDto);
    }

    @Delete(':id')
    remove(@Param('id') id: string) {
        return this.getterService.remove(+id);
    }
}
