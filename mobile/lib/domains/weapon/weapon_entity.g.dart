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
    );

Map<String, dynamic> _$$WeaponEntityImplToJson(_$WeaponEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'href': instance.href,
      'rank': instance.rank,
      'type': _$WeaponTypeEnumMap[instance.type],
      'imageUrl': instance.imageUrl,
    };

const _$WeaponTypeEnumMap = {
  WeaponType.Broadblade: 'Broadblade',
  WeaponType.Gauntlets: 'Gauntlets',
  WeaponType.Pistols: 'Pistols',
  WeaponType.Rectifier: 'Rectifier',
  WeaponType.Sword: 'Sword',
};
