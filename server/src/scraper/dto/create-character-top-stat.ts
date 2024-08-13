import {Expose} from "class-transformer";
import {IsOptional} from "class-validator";

export class CreateCharacterTopStat {

    @Expose()
    @IsOptional()
    atk: string;

    @IsOptional()
    hp: string;

    @IsOptional()
    def: string;

    @IsOptional()
    crit_rate: string;

    @IsOptional()
    crit_dmg: string;

    @IsOptional()
    energy_regen: string;

    @IsOptional()
    max_resonance_energy: string;
}