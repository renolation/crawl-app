import {Column, Entity, JoinTable, ManyToMany, ManyToOne, OneToMany, PrimaryGeneratedColumn} from "typeorm";
import {SonataEffectEntity} from "./sonata_effect.entity";
import {EchoSubStatEntity} from "./echo_sub_stat.entity";
import {EchoLevelRank} from "./echo_level_rank.entity";
import {EchoAbilityEntity} from "./echo_ability.entity";


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

    @Column({nullable: true})
    class: string

    @Column()
    cost: number

    @OneToMany(() => EchoAbilityEntity, ability => ability.echo)
    echoAbility: EchoAbilityEntity[];

    @ManyToOne(() => EchoSubStatEntity, echoSubStat => echoSubStat.id)
    echoSubStat: EchoSubStatEntity;

    @ManyToMany(() => SonataEffectEntity, sonataEffect => sonataEffect.echoes)
    sonataEffects: SonataEffectEntity[];

    @OneToMany(() => EchoLevelRank, levelRank => levelRank.echo)
    levelRanks: EchoLevelRank[];
}