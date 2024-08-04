import {Column, Entity, ManyToMany, ManyToOne, PrimaryGeneratedColumn} from "typeorm";
import {SonataEffectEntity} from "./sonata_effect.entity";


@Entity()
export class EchoEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string

    @Column()
    imageUrl: string

    @Column()
    cost: number

    @ManyToMany(() => SonataEffectEntity, sonataEffect => sonataEffect.echoes)
    sonataEffects: SonataEffectEntity[];
}