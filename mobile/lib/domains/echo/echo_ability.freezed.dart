// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'echo_ability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EchoAbility _$EchoAbilityFromJson(Map<String, dynamic> json) {
  return _EchoAbility.fromJson(json);
}

/// @nodoc
mixin _$EchoAbility {
  int? get id => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EchoAbilityCopyWith<EchoAbility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EchoAbilityCopyWith<$Res> {
  factory $EchoAbilityCopyWith(
          EchoAbility value, $Res Function(EchoAbility) then) =
      _$EchoAbilityCopyWithImpl<$Res, EchoAbility>;
  @useResult
  $Res call({int? id, String? imageUrl, int? rank, String? value});
}

/// @nodoc
class _$EchoAbilityCopyWithImpl<$Res, $Val extends EchoAbility>
    implements $EchoAbilityCopyWith<$Res> {
  _$EchoAbilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? rank = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EchoAbilityImplCopyWith<$Res>
    implements $EchoAbilityCopyWith<$Res> {
  factory _$$EchoAbilityImplCopyWith(
          _$EchoAbilityImpl value, $Res Function(_$EchoAbilityImpl) then) =
      __$$EchoAbilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? imageUrl, int? rank, String? value});
}

/// @nodoc
class __$$EchoAbilityImplCopyWithImpl<$Res>
    extends _$EchoAbilityCopyWithImpl<$Res, _$EchoAbilityImpl>
    implements _$$EchoAbilityImplCopyWith<$Res> {
  __$$EchoAbilityImplCopyWithImpl(
      _$EchoAbilityImpl _value, $Res Function(_$EchoAbilityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? rank = freezed,
    Object? value = freezed,
  }) {
    return _then(_$EchoAbilityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EchoAbilityImpl implements _EchoAbility {
  const _$EchoAbilityImpl({this.id, this.imageUrl, this.rank, this.value});

  factory _$EchoAbilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EchoAbilityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? imageUrl;
  @override
  final int? rank;
  @override
  final String? value;

  @override
  String toString() {
    return 'EchoAbility(id: $id, imageUrl: $imageUrl, rank: $rank, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EchoAbilityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl, rank, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EchoAbilityImplCopyWith<_$EchoAbilityImpl> get copyWith =>
      __$$EchoAbilityImplCopyWithImpl<_$EchoAbilityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EchoAbilityImplToJson(
      this,
    );
  }
}

abstract class _EchoAbility implements EchoAbility {
  const factory _EchoAbility(
      {final int? id,
      final String? imageUrl,
      final int? rank,
      final String? value}) = _$EchoAbilityImpl;

  factory _EchoAbility.fromJson(Map<String, dynamic> json) =
      _$EchoAbilityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get imageUrl;
  @override
  int? get rank;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$EchoAbilityImplCopyWith<_$EchoAbilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
