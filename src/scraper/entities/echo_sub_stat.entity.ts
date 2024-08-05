import {Column, Entity, OneToMany, PrimaryGeneratedColumn} from "typeorm";
import {EchoEntity} from "./echo.entity";

@Entity()
export class EchoSubStatEntity {

    @PrimaryGeneratedColumn()
    id: number;

    @Column({ unique: true })
    hp: string;

    @Column({ unique: true })
    atk: string;

    @Column({ unique: true })
    def: string;

    @Column({ unique: true })
    hp_percent: string;

    @Column({ unique: true })
    atk_percent: string;

    @Column({ unique: true })
    def_percent: string;

    @Column({ unique: true })
    crit_rate: string;

    @Column({ unique: true })
    crit_dmg: string;

    @Column({ unique: true })
    energy_regen: string;

    @Column({ unique: true })
    resonance_skill_dmg_bonus: string;

    @Column({ unique: true })
    basic_atk_dmg_bonus: string;

    @Column({ unique: true })
    heavy_atk_dmg_bonus: string;

    @Column({ unique: true })
    resonance_liberation_dmg_bonus: string;

    @OneToMany(() => EchoEntity, echo => echo.echoSubStat)
    echoes: EchoEntity[];

}