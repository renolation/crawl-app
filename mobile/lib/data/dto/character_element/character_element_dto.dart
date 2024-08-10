

import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_element_dto.freezed.dart';
part 'character_element_dto.g.dart';
@freezed
class CharacterElementDTO with _$CharacterElementDTO {
  const factory CharacterElementDTO({
    int? id,
    String? name,
    String? imageUrl,
  }) = _CharacterElementDTO;

  factory CharacterElementDTO.fromJson(Map<String, dynamic> json) =>
      _$CharacterElementDTOFromJson(json);
}
