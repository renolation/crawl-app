// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_level_rank_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeaponLevelRankEntityImpl _$$WeaponLevelRankEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$WeaponLevelRankEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      level: (json['level'] as num?)?.toInt(),
      rank: (json['rank'] as num?)?.toInt(),
      stat1Name: json['stat1_name'] as String?,
      stat1Value: json['stat1_value'] as String?,
      stat2Name: json['stat2_name'] as String?,
      stat2Value: json['stat2_value'] as String?,
      ascensionMaxLevel: (json['ascension_max_level'] as num?)?.toInt(),
      about: json['about'] as String?,
      itemCounts: (json['itemCounts'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => WeaponSkillEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeaponLevelRankEntityImplToJson(
        _$WeaponLevelRankEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'rank': instance.rank,
      'stat1_name': instance.stat1Name,
      'stat1_value': instance.stat1Value,
      'stat2_name': instance.stat2Name,
      'stat2_value': instance.stat2Value,
      'ascension_max_level': instance.ascensionMaxLevel,
      'about': instance.about,
      'itemCounts': instance.itemCounts,
      'items': instance.items,
      'skills': instance.skills,
    };
