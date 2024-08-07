import {
    Column,
    Entity,
    JoinColumn,
    JoinTable,
    ManyToMany,
    ManyToOne,
    OneToOne,
    PrimaryGeneratedColumn,
    Unique
} from "typeorm";
import {EchoEntity} from "./echo.entity";
import {SkillEntity} from "./skill.entity";
import {EchoAbilityEntity} from "./echo_ability.entity";
import {EchoMainStatEntity} from "./echo_main_stat.entity";

@Entity()
@Unique(['level', 'rank', 'echo','echoMainStatEntity'])
export class EchoLevelRank {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    level: number;

    @Column()
    rank: number;

    @ManyToOne(() => EchoEntity, echo => echo.levelRanks)
    echo: EchoEntity;

    @ManyToMany(() => EchoAbilityEntity)
    @JoinTable()
    echo_ability: EchoAbilityEntity[];

    @OneToOne(() => EchoMainStatEntity, {cascade: true})
    @JoinColumn()
    echoMainStatEntity: EchoMainStatEntity;

}