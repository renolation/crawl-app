import 'package:freezed_annotation/freezed_annotation.dart';

import 'echo_main_stat_entity.dart';

part 'echo_level_rank_entity.freezed.dart';

part 'echo_level_rank_entity.g.dart';

@freezed
class EchoLevelRankEntity with _$EchoLevelRankEntity {
  const factory EchoLevelRankEntity({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "level") int? level,
    @JsonKey(name: "rank") int? rank,
    @JsonKey(name: "echoMainStatEntity") EchoMainStatEntity? echoMainStatEntity,
  }) = _EchoLevelRankEntity;

  factory EchoLevelRankEntity.fromJson(Map<String, dynamic> json) => _$EchoLevelRankEntityFromJson(json);
}
