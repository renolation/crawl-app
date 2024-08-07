import {IsOptional} from "class-validator";
import {Expose} from "class-transformer";

export class CreateEchoMainStatDto {

    @Expose()
    @IsOptional()
    atk: string;

    @IsOptional()
    atk_percent: string;

    @IsOptional()
    hp: string;

    @IsOptional()
    hp_percent: string;

    @IsOptional()
    def_percent: string;

    @IsOptional()
    crit_rate: string;

    @IsOptional()
    crit_dmg: string;
    @IsOptional()
    healing_bonus: string;
    @IsOptional()
    glacio_dmg_bonus: string;
    @IsOptional()
    fusion_dmg_bonus: string;
    @IsOptional()
    electro_dmg_bonus: string;
    @IsOptional()
    aero_dmg_bonus: string;
    @IsOptional()
    spectro_dmg_bonus: string;
    @IsOptional()
    havoc_dmg_bonus: string;
    @IsOptional()
    energy_regen: string;
}
