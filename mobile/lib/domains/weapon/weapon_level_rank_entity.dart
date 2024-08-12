
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
    String? stat1Name,
    String? stat1Value,
    String? stat2Name,
    String? stat2Value,

    int? ascensionMaxLevel,
    String? about,
    List<int>? itemCounts,
    List<ItemEntity>? items,
    List<WeaponSkillEntity>? skills,
  }) = _WeaponLevelRankEntity;

  factory WeaponLevelRankEntity.fromJson(Map<String, dynamic> json) =>
      _$WeaponLevelRankEntityFromJson(json);
}