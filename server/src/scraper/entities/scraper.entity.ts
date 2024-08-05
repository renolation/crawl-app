import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Scraper {

  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  url: string;

}
