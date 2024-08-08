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

    @Column({nullable: true})
    mainImageUrl: string

    @Column({nullable: true})
    buble: string

    @Column({nullable: true})
    birthday: string

    @Column({nullable: true})
    introduction: string

    @ManyToOne(() => CharacterEntity, character => character.characterElement)
    characterElement: CharElementEntity;
}