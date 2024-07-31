import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class ItemEntity {

  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  name: string;

  @Column()
  subTypes: string;

  @Column()
  description: string;

  @Column()
  rank: number;

  @Column()
  type: string;

  @Column()
  imageUrl: string;



}
