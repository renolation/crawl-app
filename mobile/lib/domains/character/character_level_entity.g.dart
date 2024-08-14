// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_level_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterLevelEntityImpl _$$CharacterLevelEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterLevelEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      level: (json['level'] as num?)?.toInt(),
      hp: json['hp'] as String?,
      atk: json['atk'] as String?,
      def: json['def'] as String?,
      critRate: json['crit_rate'] as String?,
      critDmg: json['crit_dmg'] as String?,
      energyRegen: json['energy_regen'] as String?,
      maxResonanceEnergy: json['max_resonance_energy'] as String?,
      ascensionMaxLevel: (json['ascension_max_level'] as num?)?.toInt(),
      itemCounts: (json['itemCounts'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CharacterLevelEntityImplToJson(
        _$CharacterLevelEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'hp': instance.hp,
      'atk': instance.atk,
      'def': instance.def,
      'crit_rate': instance.critRate,
      'crit_dmg': instance.critDmg,
      'energy_regen': instance.energyRegen,
      'max_resonance_energy': instance.maxResonanceEnergy,
      'ascension_max_level': instance.ascensionMaxLevel,
      'itemCounts': instance.itemCounts,
      'items': instance.items,
    };
