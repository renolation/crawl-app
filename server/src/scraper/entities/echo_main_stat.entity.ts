import {Column, Entity, OneToOne, PrimaryGeneratedColumn} from "typeorm";
import {EchoLevelRank} from "./echo_level_rank.entity";

@Entity()
export class EchoMainStatEntity {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    atk: string;

    @Column({nullable: true})
    atk_percent: string;

    @Column({nullable: true})
    hp: string

    @Column({nullable: true})
    hp_percent: string

    @Column({nullable: true})
    def_percent: string

    @Column({nullable: true})
    crit_rate: string

    @Column({nullable: true})
    crit_dmg: string

    @Column({nullable: true})
    healing_bonus: string

    @Column({nullable: true})
    glacio_dmg_bonus: string

    @Column({nullable: true})
    fusion_dmg_bonus: string

    @Column({nullable: true})
    electro_dmg_bonus: string

    @Column({nullable: true})
    aero_dmg_bonus: string

    @Column({nullable: true})
    spectro_dmg_bonus: string

    @Column({nullable: true})
    havoc_dmg_bonus: string

    @Column({nullable: true})
    energy_regen: string

    // @OneToOne(() => EchoLevelRank, levelRank => levelRank.echoMainStatEntity)
    // levelRank: EchoLevelRank;

}