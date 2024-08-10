import { Controller, Post, Body } from '@nestjs/common';
import { UploadService } from './upload.service';

@Controller('upload')
export class UploadController {
    constructor(private readonly uploadService: UploadService) {}

    @Post('image')
    async uploadImage(@Body('imageUrl') imageUrl: string) {
        const uploadedUrl = await this.uploadService.uploadImage(imageUrl);
        return { url: uploadedUrl };
    }
}