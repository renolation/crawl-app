
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/domains/item/item_entity.dart';
import 'package:mobile/domains/weapon/weapon_skill_entity.dart';

part 'weapon_level_rank_entity.freezed.dart';
part 'weapon_level_rank_entity.g.dart';
@freezed
class WeaponLevelRankEntity with _$WeaponLevelRankEntity {
  const factory WeaponLevelRankEntity({
    int? id,
    int? level,
    int? rank,
    @JsonKey(name: 'stat1_name')String? stat1Name,
    @JsonKey(name: 'stat1_value')String? stat1Value,
    @JsonKey(name: 'stat2_name')String? stat2Name,
    @JsonKey(name: 'stat2_value')String? stat2Value,

    @JsonKey(name: 'ascension_max_level')int? ascensionMaxLevel,
    String? about,
    List<int>? itemCounts,
    List<ItemEntity>? items,
    List<WeaponSkillEntity>? skills,
  }) = _WeaponLevelRankEntity;

  factory WeaponLevelRankEntity.fromJson(Map<String, dynamic> json) =>
      _$WeaponLevelRankEntityFromJson(json);
}