import {Column, Entity, JoinTable, ManyToMany, ManyToOne, PrimaryGeneratedColumn, Unique} from "typeorm";
import {EchoLevelRank} from "./echo_level_rank.entity";
import {EchoEntity} from "./echo.entity";

@Entity()
@Unique(['imageUrl', 'rank', 'value'])
export class EchoAbilityEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    imageUrl: string

    @Column()
    rank: number

    @Column()
    value: string

    @ManyToOne(() => EchoEntity, echo => echo.echoAbility)
    echo: EchoEntity;

}