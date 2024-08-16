import {Column, Entity, JoinTable, ManyToMany, OneToMany, PrimaryGeneratedColumn, Unique} from "typeorm";
import {EchoEntity} from "./echo.entity";

@Entity()
@Unique(['name', 'index'])
export class SonataEffectEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string

    @Column()
    imageUrl: string

    @Column()
    index: number

    @Column({nullable: true})
    two_set: string

    @Column({nullable: true})
    five_set: string

    @Column({nullable: true})
    color: string

    @ManyToMany(() => EchoEntity, echo => echo.sonataEffects)
    @JoinTable()
    echoes: EchoEntity[];
}