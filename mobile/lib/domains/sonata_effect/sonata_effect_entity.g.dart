// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sonata_effect_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SonataEffectEntityImpl _$$SonataEffectEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$SonataEffectEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      index: (json['index'] as num?)?.toInt(),
      color: json['color'] as String?,
      two_set: json['two_set'] as String?,
      five_set: json['five_set'] as String?,
    );

Map<String, dynamic> _$$SonataEffectEntityImplToJson(
        _$SonataEffectEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'index': instance.index,
      'color': instance.color,
      'two_set': instance.two_set,
      'five_set': instance.five_set,
    };
