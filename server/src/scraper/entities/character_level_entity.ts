import {Column, Entity, JoinTable, ManyToMany, ManyToOne, PrimaryGeneratedColumn, Unique} from "typeorm";
import {CharacterEntity} from "./character_entity";
import {ItemEntity} from "./item.entity";


@Entity()
@Unique(['level', 'character'])
export class CharacterLevelEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    level: number

    @Column()
    hp: string

    @Column()
    atk: string

    @Column()
    def: string

    @Column()
    crit_rate: string

    @Column()
    crit_dmg: string

    @Column()
    energy_regen: string

    @Column()
    max_resonance_energy: string

    @Column()
    ascension_max_level: number

    @ManyToOne(() => CharacterEntity, character => character.levels)
    character: CharacterEntity;

    @ManyToMany(() => ItemEntity)
    @JoinTable()
    items: ItemEntity[];

    @Column('int', {array: true})
    itemCounts: number[];

}