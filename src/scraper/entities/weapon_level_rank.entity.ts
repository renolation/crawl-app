import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, ManyToMany, JoinTable, Unique } from 'typeorm';
import { WeaponEntity } from './weapon.entity';
import { ItemEntity } from './item.entity';
import { SkillEntity } from './skill.entity';

@Entity()
@Unique(['level', 'rank'])
export class WeaponLevelRank {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  level: number;

  @Column()
  rank: number;

  @Column()
  stat1_name: string;

  @Column()
  stat1_value: number;

  @Column()
  stat2_name: string;

  @Column()
  stat2_value: number;

  @Column()
  ascension_max_level: number

  @Column()
  about: string

  @ManyToOne(() => WeaponEntity, weapon => weapon.levelRanks)
  weapon: WeaponEntity;

  @ManyToMany(() => ItemEntity)
  @JoinTable()
  items: ItemEntity[];

  @Column('int', { array: true })
  itemCounts: number[];

  @ManyToMany(() => SkillEntity)
  @JoinTable()
  skills: SkillEntity[];
}