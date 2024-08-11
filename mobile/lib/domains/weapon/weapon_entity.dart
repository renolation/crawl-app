import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/core/enums/enums.dart';

part 'weapon_entity.freezed.dart';
part 'weapon_entity.g.dart';
@freezed
class WeaponEntity with _$WeaponEntity {
  const factory WeaponEntity({
    int? id,
    String? name,
    String? href,
    int? rank,
    WeaponType? type,
    String? imageUrl,
  }) = _WeaponEntity;

  factory WeaponEntity.fromJson(Map<String, dynamic> json) =>
      _$WeaponEntityFromJson(json);
}