import {
    Column,
    Entity,
    JoinColumn,
    JoinTable,
    ManyToMany,
    ManyToOne, OneToMany,
    OneToOne,
    PrimaryGeneratedColumn,
    Unique
} from "typeorm";
import {EchoEntity} from "./echo.entity";
import {SkillEntity} from "./skill.entity";
import {EchoAbilityEntity} from "./echo_ability.entity";
import {EchoMainStatEntity} from "./echo_main_stat.entity";

@Entity()
@Unique(['level', 'rank', 'echo'])
export class EchoLevelRank {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    level: number;

    @Column()
    rank: number;

    @ManyToOne(() => EchoEntity, echo => echo.levelRanks)
    echo: EchoEntity;


    @OneToOne(() => EchoMainStatEntity, mainStat => mainStat.echoLevelRank)
    @JoinColumn()
    echoMainStatEntity: EchoMainStatEntity;

}