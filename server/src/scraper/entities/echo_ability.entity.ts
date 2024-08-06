import {Column, Entity, ManyToMany, PrimaryGeneratedColumn} from "typeorm";
import {EchoLevelRank} from "./echo_level_rank.entity";

@Entity()
export class EchoAbilityEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    imageUrl: string

    @Column()
    rank: number

    @Column()
    value: string

    @ManyToMany(() => EchoLevelRank, levelRank => levelRank.echo_ability)
    levelRanks: EchoLevelRank[];

}