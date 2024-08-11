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

    @Column({nullable: true})
    rarity: number
    
    @Column()
    imageUrl: string

    @Column({nullable: true})
    mainImageUrl: string

    @Column({nullable: true})
    buble: string

    @Column({nullable: true})
    description: string

    @Column({nullable: true})
    birthday: string

    @Column({nullable: true})
    introduction: string

    @ManyToOne(() => CharElementEntity, character => character.characters)
    characterElement: CharElementEntity;
}