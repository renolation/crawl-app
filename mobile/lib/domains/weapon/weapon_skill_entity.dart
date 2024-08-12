import 'package:freezed_annotation/freezed_annotation.dart';


part 'weapon_skill_entity.freezed.dart';
part 'weapon_skill_entity.g.dart';

@freezed
class WeaponSkillEntity with _$WeaponSkillEntity {
  const factory WeaponSkillEntity({
    int? id,
    String? name,
    String? value,
  }) = _WeaponSkillEntity;

  factory WeaponSkillEntity.fromJson(Map<String, dynamic> json) =>
      _$WeaponSkillEntityFromJson(json);
}