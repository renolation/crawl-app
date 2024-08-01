import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { WeaponLevelRank } from './weapon_level_rank.entity';

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

  @OneToMany(() => WeaponLevelRank, levelRank => levelRank.weapon)
  levelRanks: WeaponLevelRank[];

}
