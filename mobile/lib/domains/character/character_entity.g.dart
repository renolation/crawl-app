// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterEntityImpl _$$CharacterEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      href: json['href'] as String?,
      rarity: (json['rarity'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      mainImageUrl: json['mainImageUrl'] as String?,
      buble: json['buble'] as String?,
      description: json['description'] as String?,
      birthday: json['birthday'] as String?,
      introduction: json['introduction'] as String?,
      characterElement: json['characterElement'] == null
          ? null
          : CharacterElementEntity.fromJson(
              json['characterElement'] as Map<String, dynamic>),
      characterLevels: (json['levels'] as List<dynamic>?)
          ?.map((e) => CharacterLevelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CharacterEntityImplToJson(
        _$CharacterEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'href': instance.href,
      'rarity': instance.rarity,
      'imageUrl': instance.imageUrl,
      'mainImageUrl': instance.mainImageUrl,
      'buble': instance.buble,
      'description': instance.description,
      'birthday': instance.birthday,
      'introduction': instance.introduction,
      'characterElement': instance.characterElement,
      'levels': instance.characterLevels,
    };
