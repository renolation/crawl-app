

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sonata_effect_entity.freezed.dart';
part 'sonata_effect_entity.g.dart';
@freezed
class SonataEffectEntity with _$SonataEffectEntity {
  const factory SonataEffectEntity({
    int? id,
    String? name,
    String? imageUrl,
    int? index,
    String? color,
    String? two_set,
    String? five_set,
  }) = _SonataEffectEntity;

  factory SonataEffectEntity.fromJson(Map<String, dynamic> json) =>
      _$SonataEffectEntityFromJson(json);
}
