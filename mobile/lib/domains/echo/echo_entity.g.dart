// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'echo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EchoEntityImpl _$$EchoEntityImplFromJson(Map<String, dynamic> json) =>
    _$EchoEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      href: json['href'] as String?,
      imageUrl: json['imageUrl'] as String?,
      echoEntityClass: json['echoEntityClass'] as String?,
      cost: (json['cost'] as num?)?.toInt(),
      sonataEffects: (json['sonataEffects'] as List<dynamic>?)
          ?.map((e) => SonataEffectEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EchoEntityImplToJson(_$EchoEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'href': instance.href,
      'imageUrl': instance.imageUrl,
      'echoEntityClass': instance.echoEntityClass,
      'cost': instance.cost,
      'sonataEffects': instance.sonataEffects,
    };
