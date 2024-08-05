import {Column, Entity, ManyToMany, PrimaryGeneratedColumn} from "typeorm";
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

    @ManyToMany( () => CharElementEntity, charElement => charElement.characters)
    characterElement: CharElementEntity[];
}