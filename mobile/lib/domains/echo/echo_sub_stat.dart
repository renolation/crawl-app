import 'package:freezed_annotation/freezed_annotation.dart';

part 'echo_sub_stat.freezed.dart';

part 'echo_sub_stat.g.dart';

@freezed
class EchoSubStat with _$EchoSubStat {
  const factory EchoSubStat({
    int? id,
    String? hp,
    String? atk,
    String? def,
    @JsonKey(name: "hp_percent") String? hpPercent,
    @JsonKey(name: "atk_percent") String? atkPercent,
    @JsonKey(name: "def_percent") String? defPercent,
    @JsonKey(name: "crit_rate") String? critRate,
    @JsonKey(name: "crit_dmg") String? critDmg,
    @JsonKey(name: "energy_regen") String? energyRegen,
    @JsonKey(name: "resonance_skill_dmg_bonus") String? resonanceSkillDmgBonus,
    @JsonKey(name: "basic_atk_dmg_bonus") String? basicAtkDmgBonus,
    @JsonKey(name: "heavy_atk_dmg_bonus") String? heavyAtkDmgBonus,
    @JsonKey(name: "resonance_liberation_dmg_bonus") String? resonanceLiberationDmgBonus,
  }) = _EchoSubStat;

  factory EchoSubStat.fromJson(Map<String, dynamic> json) => _$EchoSubStatFromJson(json);
}
