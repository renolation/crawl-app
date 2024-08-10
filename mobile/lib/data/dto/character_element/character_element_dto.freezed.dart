// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_element_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CharacterElementDTO _$CharacterElementDTOFromJson(Map<String, dynamic> json) {
  return _CharacterElementDTO.fromJson(json);
}

/// @nodoc
mixin _$CharacterElementDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterElementDTOCopyWith<CharacterElementDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterElementDTOCopyWith<$Res> {
  factory $CharacterElementDTOCopyWith(
          CharacterElementDTO value, $Res Function(CharacterElementDTO) then) =
      _$CharacterElementDTOCopyWithImpl<$Res, CharacterElementDTO>;
  @useResult
  $Res call({int? id, String? name, String? imageUrl});
}

/// @nodoc
class _$CharacterElementDTOCopyWithImpl<$Res, $Val extends CharacterElementDTO>
    implements $CharacterElementDTOCopyWith<$Res> {
  _$CharacterElementDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterElementDTOImplCopyWith<$Res>
    implements $CharacterElementDTOCopyWith<$Res> {
  factory _$$CharacterElementDTOImplCopyWith(_$CharacterElementDTOImpl value,
          $Res Function(_$CharacterElementDTOImpl) then) =
      __$$CharacterElementDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? imageUrl});
}

/// @nodoc
class __$$CharacterElementDTOImplCopyWithImpl<$Res>
    extends _$CharacterElementDTOCopyWithImpl<$Res, _$CharacterElementDTOImpl>
    implements _$$CharacterElementDTOImplCopyWith<$Res> {
  __$$CharacterElementDTOImplCopyWithImpl(_$CharacterElementDTOImpl _value,
      $Res Function(_$CharacterElementDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$CharacterElementDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterElementDTOImpl implements _CharacterElementDTO {
  const _$CharacterElementDTOImpl({this.id, this.name, this.imageUrl});

  factory _$CharacterElementDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterElementDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'CharacterElementDTO(id: $id, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterElementDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterElementDTOImplCopyWith<_$CharacterElementDTOImpl> get copyWith =>
      __$$CharacterElementDTOImplCopyWithImpl<_$CharacterElementDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterElementDTOImplToJson(
      this,
    );
  }
}

abstract class _CharacterElementDTO implements CharacterElementDTO {
  const factory _CharacterElementDTO(
      {final int? id,
      final String? name,
      final String? imageUrl}) = _$CharacterElementDTOImpl;

  factory _CharacterElementDTO.fromJson(Map<String, dynamic> json) =
      _$CharacterElementDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$CharacterElementDTOImplCopyWith<_$CharacterElementDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
