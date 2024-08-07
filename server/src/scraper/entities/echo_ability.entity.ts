import {Column, Entity, ManyToMany, PrimaryGeneratedColumn, Unique} from "typeorm";
import {EchoLevelRank} from "./echo_level_rank.entity";

@Entity()
@Unique(['rank', 'value'])
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