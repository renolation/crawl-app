import 'package:freezed_annotation/freezed_annotation.dart';

part 'echo_main_stat_entity.freezed.dart';

part 'echo_main_stat_entity.g.dart';

@freezed
class EchoMainStatEntity with _$EchoMainStatEntity {
  const factory EchoMainStatEntity({
    int? id,
    String? atk,
    @JsonKey(name: "atk_percent") String? atkPercent,
    @JsonKey(name: "hp") dynamic hp,
    @JsonKey(name: "hp_percent") String? hpPercent,
    @JsonKey(name: "def_percent") String? defPercent,
    @JsonKey(name: "crit_rate") String? critRate,
    @JsonKey(name: "crit_dmg") String? critDmg,
    @JsonKey(name: "healing_bonus") String? healingBonus,
    @JsonKey(name: "glacio_dmg_bonus") dynamic glacioDmgBonus,
    @JsonKey(name: "fusion_dmg_bonus") dynamic fusionDmgBonus,
    @JsonKey(name: "electro_dmg_bonus") dynamic electroDmgBonus,
    @JsonKey(name: "aero_dmg_bonus") dynamic aeroDmgBonus,
    @JsonKey(name: "spectro_dmg_bonus") dynamic spectroDmgBonus,
    @JsonKey(name: "havoc_dmg_bonus") dynamic havocDmgBonus,
    @JsonKey(name: "energy_regen") dynamic energyRegen,
  }) = _EchoMainStatEntity;

  factory EchoMainStatEntity.fromJson(Map<String, dynamic> json) => _$EchoMainStatEntityFromJson(json);
}
