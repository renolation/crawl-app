
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_entity.freezed.dart';
part 'item_entity.g.dart';

@freezed
class ItemEntity with _$ItemEntity {
  const factory ItemEntity({
    int? id,
    String? name,
    String? subTypes,
    String? description,
    int? rank,
    String? type,
    String? imageUrl,
  }) = _ItemEntity;

  factory ItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ItemEntityFromJson(json);
}