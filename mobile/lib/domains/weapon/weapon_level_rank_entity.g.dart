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
      stat1Name: json['stat1Name'] as String?,
      stat1Value: json['stat1Value'] as String?,
      stat2Name: json['stat2Name'] as String?,
      stat2Value: json['stat2Value'] as String?,
      ascensionMaxLevel: (json['ascensionMaxLevel'] as num?)?.toInt(),
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
      'stat1Name': instance.stat1Name,
      'stat1Value': instance.stat1Value,
      'stat2Name': instance.stat2Name,
      'stat2Value': instance.stat2Value,
      'ascensionMaxLevel': instance.ascensionMaxLevel,
      'about': instance.about,
      'itemCounts': instance.itemCounts,
      'items': instance.items,
      'skills': instance.skills,
    };
