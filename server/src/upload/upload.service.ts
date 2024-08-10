import {Injectable} from '@nestjs/common';
import {Storage} from '@google-cloud/storage';
import {v4 as uuidv4} from 'uuid';

@Injectable()
export class UploadService {
    private storage: Storage;
    private bucketName: string;

    constructor() {
        this.storage = new Storage({
            projectId: 'renolation',
            keyFilename: 'src/common/files/renolation.json',
        });
        this.bucketName = 'dl.renolation.com';
    }

    async uploadImage(imageUrl: string): Promise<string> {
        const bucket = this.storage.bucket(this.bucketName);
        const fileName = `${uuidv4()}.jpg`;
        const file = bucket.file(fileName);

        const response = await fetch(imageUrl);
        const buffer = Buffer.from(await response.arrayBuffer());

        await file.save(buffer, {
            metadata: {contentType: 'image/jpeg'},
        });

        return `https://storage.googleapis.com/${this.bucketName}/${fileName}`;
    }
}