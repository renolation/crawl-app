import {Column, Entity, JoinTable, ManyToMany, OneToMany, PrimaryGeneratedColumn} from "typeorm";
import {CharacterEntity} from "./character_entity";

@Entity()
export class CharElementEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string

    @Column()
    imageUrl: string

    @OneToMany(() => CharacterEntity, character => character.characterElement)
    characters: CharacterEntity[];

}
