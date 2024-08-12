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
      echoLevelRank: (json['levelRanks'] as List<dynamic>?)
          ?.map((e) => EchoLevelRankEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      echoSubStat: json['echoSubStat'] == null
          ? null
          : EchoSubStat.fromJson(json['echoSubStat'] as Map<String, dynamic>),
      echoAbility: (json['echoAbility'] as List<dynamic>?)
          ?.map((e) => EchoAbility.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'levelRanks': instance.echoLevelRank,
      'echoSubStat': instance.echoSubStat,
      'echoAbility': instance.echoAbility,
      'sonataEffects': instance.sonataEffects,
    };
