

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/domains/character/character_level_entity.dart';
import 'package:mobile/domains/character_element/character_element_entity.dart';

part 'character_entity.freezed.dart';
part 'character_entity.g.dart';
@freezed
class CharacterEntity with _$CharacterEntity {
  const factory CharacterEntity({
    int? id,
    String? name,
    String? href,
    int? rarity,
    String? imageUrl,
    String? mainImageUrl,
    String? buble,
    String? description,
    String? birthday,
    String? introduction,
    CharacterElementEntity? characterElement,
    @JsonKey(name: "levels")
    List<CharacterLevelEntity>? characterLevels,
  }) = _CharacterEntity;

  factory CharacterEntity.fromJson(Map<String, dynamic> json) =>
      _$CharacterEntityFromJson(json);

}