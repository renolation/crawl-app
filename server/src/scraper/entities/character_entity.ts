import {Column, Entity, JoinColumn, ManyToMany, ManyToOne, OneToMany, PrimaryGeneratedColumn} from "typeorm";
import {CharElementEntity} from "./char_element.entity";

@Entity()
export class CharacterEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string

    @Column()
    href: string

    @Column()
    imageUrl: string

    @ManyToOne(() => CharacterEntity, character => character.characterElement)
    characterElement: CharElementEntity;
}