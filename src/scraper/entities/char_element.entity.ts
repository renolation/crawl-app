import {Column, Entity, PrimaryGeneratedColumn} from "typeorm";

@Entity()
export class CharElementEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string

    @Column()
    imageUrl: string

}
