import {Column, Entity, JoinTable, ManyToMany, PrimaryGeneratedColumn} from "typeorm";
import {CharacterEntity} from "./character_entity";

@Entity()
export class CharElementEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string

    @Column()
    imageUrl: string

    @ManyToMany( () => CharacterEntity, character => character.characterElement)
    @JoinTable()
    characters: CharacterEntity[];

}
