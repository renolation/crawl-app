// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeaponEntityImpl _$$WeaponEntityImplFromJson(Map<String, dynamic> json) =>
    _$WeaponEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      href: json['href'] as String?,
      rank: (json['rank'] as num?)?.toInt(),
      type: $enumDecodeNullable(_$WeaponTypeEnumMap, json['type']),
      imageUrl: json['imageUrl'] as String?,
      weaponLevelRank: (json['levelRanks'] as List<dynamic>?)
          ?.map(
              (e) => WeaponLevelRankEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeaponEntityImplToJson(_$WeaponEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'href': instance.href,
      'rank': instance.rank,
      'type': _$WeaponTypeEnumMap[instance.type],
      'imageUrl': instance.imageUrl,
      'levelRanks': instance.weaponLevelRank,
    };

const _$WeaponTypeEnumMap = {
  WeaponType.Any: 'Any',
  WeaponType.Broadblade: 'Broadblade',
  WeaponType.Gauntlets: 'Gauntlets',
  WeaponType.Pistols: 'Pistols',
  WeaponType.Rectifier: 'Rectifier',
  WeaponType.Sword: 'Sword',
};
