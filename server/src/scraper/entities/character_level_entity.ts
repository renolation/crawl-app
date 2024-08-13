import {Column, Entity, JoinTable, ManyToMany, ManyToOne, PrimaryGeneratedColumn} from "typeorm";
import {CharacterEntity} from "./character_entity";
import {ItemEntity} from "./item.entity";


@Entity()
export class CharacterLevelEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    level: number

    @Column()
    hp: number

    @Column()
    atk: number

    @Column()
    def: number

    @Column()
    crit_rate: number

    @Column()
    crit_dmg: number

    @Column()
    energy_regen: number

    @Column()
    max_resonance_energy: number

    @ManyToOne(() => CharacterEntity, character => character.levels)
    character: CharacterEntity;

    @ManyToMany(() => ItemEntity)
    @JoinTable()
    items: ItemEntity[];

    @Column('int', {array: true})
    itemCounts: number[];

}