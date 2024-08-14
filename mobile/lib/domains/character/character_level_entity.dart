import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/domains/item/item_entity.dart';

part 'character_level_entity.freezed.dart';

part 'character_level_entity.g.dart';

@freezed
class CharacterLevelEntity with _$CharacterLevelEntity {
  const factory CharacterLevelEntity({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "level") int? level,
    @JsonKey(name: "hp") String? hp,
    @JsonKey(name: "atk") String? atk,
    @JsonKey(name: "def") String? def,
    @JsonKey(name: "crit_rate") String? critRate,
    @JsonKey(name: "crit_dmg") String? critDmg,
    @JsonKey(name: "energy_regen") String? energyRegen,
    @JsonKey(name: "max_resonance_energy") String? maxResonanceEnergy,
    @JsonKey(name: "ascension_max_level") int? ascensionMaxLevel,
    @JsonKey(name: "itemCounts") List<int>? itemCounts,
    @JsonKey(name: "items") List<ItemEntity>? items,
  }) = _CharacterLevelEntity;

  factory CharacterLevelEntity.fromJson(Map<String, dynamic> json) =>
      _$CharacterLevelEntityFromJson(json);
}
