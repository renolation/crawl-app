import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/domains/echo/echo_ability.dart';
import 'package:mobile/domains/echo/echo_level_rank_entity.dart';
import 'package:mobile/domains/echo/echo_sub_stat.dart';
import 'package:mobile/domains/sonata_effect/sonata_effect_entity.dart';

part 'echo_entity.freezed.dart';

part 'echo_entity.g.dart';

@freezed
class EchoEntity with _$EchoEntity {
  const factory EchoEntity({
    int? id,
    String? name,
    String? href,
    String? imageUrl,
    String? echoEntityClass,
    int? cost,
    @JsonKey(name: "levelRanks") List<EchoLevelRankEntity>? echoLevelRank,
    @JsonKey(name: "echoSubStat") EchoSubStat? echoSubStat,
    @JsonKey(name: "echoAbility") List<EchoAbility>? echoAbility,
    List<SonataEffectEntity>? sonataEffects,
  }) = _EchoEntity;

  factory EchoEntity.fromJson(Map<String, dynamic> json) => _$EchoEntityFromJson(json);
}
