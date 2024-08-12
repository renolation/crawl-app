// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_skill_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeaponSkillEntityImpl _$$WeaponSkillEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$WeaponSkillEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$WeaponSkillEntityImplToJson(
        _$WeaponSkillEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
    };
