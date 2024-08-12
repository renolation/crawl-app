// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'echo_level_rank_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EchoLevelRankEntityImpl _$$EchoLevelRankEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$EchoLevelRankEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      level: (json['level'] as num?)?.toInt(),
      rank: (json['rank'] as num?)?.toInt(),
      echoMainStatEntity: json['echoMainStatEntity'] == null
          ? null
          : EchoMainStatEntity.fromJson(
              json['echoMainStatEntity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EchoLevelRankEntityImplToJson(
        _$EchoLevelRankEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'rank': instance.rank,
      'echoMainStatEntity': instance.echoMainStatEntity,
    };
