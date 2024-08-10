// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_element_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterElementDTOImpl _$$CharacterElementDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterElementDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$CharacterElementDTOImplToJson(
        _$CharacterElementDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
