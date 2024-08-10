

import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_element_entity.freezed.dart';
part 'character_element_entity.g.dart';
@freezed
class CharacterElementEntity with _$CharacterElementEntity {
  const factory CharacterElementEntity({
    int? id,
    String? name,
    String? imageUrl,
  }) = _CharacterElementDTO;

  factory CharacterElementEntity.fromJson(Map<String, dynamic> json) =>
      _$CharacterElementEntityFromJson(json);
}
