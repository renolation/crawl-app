
import 'package:freezed_annotation/freezed_annotation.dart';

part 'echo_ability.freezed.dart';
part 'echo_ability.g.dart';


@freezed
class EchoAbility with _$EchoAbility {
  const factory EchoAbility({
    int? id,
    String? imageUrl,
    int? rank,
    String? value,
  }) = _EchoAbility;

  factory EchoAbility.fromJson(Map<String, dynamic> json) =>
      _$EchoAbilityFromJson(json);
}