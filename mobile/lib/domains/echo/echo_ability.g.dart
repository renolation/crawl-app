// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'echo_ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EchoAbilityImpl _$$EchoAbilityImplFromJson(Map<String, dynamic> json) =>
    _$EchoAbilityImpl(
      id: (json['id'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String?,
      rank: (json['rank'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$EchoAbilityImplToJson(_$EchoAbilityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'rank': instance.rank,
      'value': instance.value,
    };
