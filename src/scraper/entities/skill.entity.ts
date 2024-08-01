import { Entity, PrimaryGeneratedColumn, Column, ManyToMany } from 'typeorm';
import { WeaponLevelRank } from './weapon_level_rank.entity';

@Entity()
export class SkillEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  name: string;

  @Column()
  value: string;

  @ManyToMany(() => WeaponLevelRank, levelRank => levelRank.skills)
  levelRanks: WeaponLevelRank[];
}