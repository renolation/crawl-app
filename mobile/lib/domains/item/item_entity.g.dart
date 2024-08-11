// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemEntityImpl _$$ItemEntityImplFromJson(Map<String, dynamic> json) =>
    _$ItemEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      subTypes: json['subTypes'] as String?,
      description: json['description'] as String?,
      rank: (json['rank'] as num?)?.toInt(),
      type: json['type'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$ItemEntityImplToJson(_$ItemEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subTypes': instance.subTypes,
      'description': instance.description,
      'rank': instance.rank,
      'type': instance.type,
      'imageUrl': instance.imageUrl,
    };
