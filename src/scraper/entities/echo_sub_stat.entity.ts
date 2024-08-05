import {Column, Entity, OneToMany, PrimaryGeneratedColumn} from "typeorm";
import {EchoEntity} from "./echo.entity";

@Entity()
export class EchoSubStatEntity {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    hp: string;

    @Column()
    atk: string;

    @Column()
    def: string;

    @Column()
    atk_percent: string;

    @Column()
    def_percent: string;

    @Column()
    crit_rate: string;

    @Column()
    crit_dmg: string;

    @Column()
    energy_regen: string;

    @Column()
    resonance_skill_dmg_bonus: string;

    @Column()
    basic_atk_dmg_bonus: string;

    @Column()
    heavy_atk_dmg_bonus: string;

    @Column()
    resonance_liberation_dmg_bonus: string;

    @OneToMany(() => EchoEntity, echo => echo.echoSubStat)
    echoes: EchoEntity[];

}