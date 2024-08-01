import { Column, Entity, ManyToMany, PrimaryGeneratedColumn } from 'typeorm';
import { WeaponLevelRank } from './weapon_level_rank.entity';

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

  @ManyToMany(() => WeaponLevelRank, levelRank => levelRank.items)
  levelRanks: WeaponLevelRank[];

}
