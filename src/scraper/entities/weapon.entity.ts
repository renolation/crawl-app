import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class WeaponEntity {

  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  name: string;

  @Column({ unique: true })
  href: string;

  @Column()
  rank: number;

  @Column()
  type: string;

  @Column()
  imageUrl: string;



}
