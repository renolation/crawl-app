import {Column, Entity, ManyToMany, ManyToOne, PrimaryGeneratedColumn} from "typeorm";
import {SonataEffectEntity} from "./sonata_effect.entity";
import {EchoSubStatEntity} from "./echo_sub_stat.entity";


@Entity()
export class EchoEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string

    @Column()
    href: string

    @Column()
    imageUrl: string

    @Column()
    cost: number

    @ManyToOne(() => EchoSubStatEntity, echoSubStat => echoSubStat.id)
    echoSubStat: EchoSubStatEntity;

    @ManyToMany(() => SonataEffectEntity, sonataEffect => sonataEffect.echoes)
    sonataEffects: SonataEffectEntity[];
}