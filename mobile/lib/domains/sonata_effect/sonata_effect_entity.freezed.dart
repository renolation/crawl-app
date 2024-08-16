// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sonata_effect_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SonataEffectEntity _$SonataEffectEntityFromJson(Map<String, dynamic> json) {
  return _SonataEffectEntity.fromJson(json);
}

/// @nodoc
mixin _$SonataEffectEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  int? get index => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get two_set => throw _privateConstructorUsedError;
  String? get five_set => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SonataEffectEntityCopyWith<SonataEffectEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SonataEffectEntityCopyWith<$Res> {
  factory $SonataEffectEntityCopyWith(
          SonataEffectEntity value, $Res Function(SonataEffectEntity) then) =
      _$SonataEffectEntityCopyWithImpl<$Res, SonataEffectEntity>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? imageUrl,
      int? index,
      String? color,
      String? two_set,
      String? five_set});
}

/// @nodoc
class _$SonataEffectEntityCopyWithImpl<$Res, $Val extends SonataEffectEntity>
    implements $SonataEffectEntityCopyWith<$Res> {
  _$SonataEffectEntityCopyWithImpl(this._value, this._then);

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
    Object? index = freezed,
    Object? color = freezed,
    Object? two_set = freezed,
    Object? five_set = freezed,
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
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      two_set: freezed == two_set
          ? _value.two_set
          : two_set // ignore: cast_nullable_to_non_nullable
              as String?,
      five_set: freezed == five_set
          ? _value.five_set
          : five_set // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SonataEffectEntityImplCopyWith<$Res>
    implements $SonataEffectEntityCopyWith<$Res> {
  factory _$$SonataEffectEntityImplCopyWith(_$SonataEffectEntityImpl value,
          $Res Function(_$SonataEffectEntityImpl) then) =
      __$$SonataEffectEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? imageUrl,
      int? index,
      String? color,
      String? two_set,
      String? five_set});
}

/// @nodoc
class __$$SonataEffectEntityImplCopyWithImpl<$Res>
    extends _$SonataEffectEntityCopyWithImpl<$Res, _$SonataEffectEntityImpl>
    implements _$$SonataEffectEntityImplCopyWith<$Res> {
  __$$SonataEffectEntityImplCopyWithImpl(_$SonataEffectEntityImpl _value,
      $Res Function(_$SonataEffectEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? index = freezed,
    Object? color = freezed,
    Object? two_set = freezed,
    Object? five_set = freezed,
  }) {
    return _then(_$SonataEffectEntityImpl(
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
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      two_set: freezed == two_set
          ? _value.two_set
          : two_set // ignore: cast_nullable_to_non_nullable
              as String?,
      five_set: freezed == five_set
          ? _value.five_set
          : five_set // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SonataEffectEntityImpl implements _SonataEffectEntity {
  const _$SonataEffectEntityImpl(
      {this.id,
      this.name,
      this.imageUrl,
      this.index,
      this.color,
      this.two_set,
      this.five_set});

  factory _$SonataEffectEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SonataEffectEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? imageUrl;
  @override
  final int? index;
  @override
  final String? color;
  @override
  final String? two_set;
  @override
  final String? five_set;

  @override
  String toString() {
    return 'SonataEffectEntity(id: $id, name: $name, imageUrl: $imageUrl, index: $index, color: $color, two_set: $two_set, five_set: $five_set)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SonataEffectEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.two_set, two_set) || other.two_set == two_set) &&
            (identical(other.five_set, five_set) ||
                other.five_set == five_set));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, imageUrl, index, color, two_set, five_set);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SonataEffectEntityImplCopyWith<_$SonataEffectEntityImpl> get copyWith =>
      __$$SonataEffectEntityImplCopyWithImpl<_$SonataEffectEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SonataEffectEntityImplToJson(
      this,
    );
  }
}

abstract class _SonataEffectEntity implements SonataEffectEntity {
  const factory _SonataEffectEntity(
      {final int? id,
      final String? name,
      final String? imageUrl,
      final int? index,
      final String? color,
      final String? two_set,
      final String? five_set}) = _$SonataEffectEntityImpl;

  factory _SonataEffectEntity.fromJson(Map<String, dynamic> json) =
      _$SonataEffectEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get imageUrl;
  @override
  int? get index;
  @override
  String? get color;
  @override
  String? get two_set;
  @override
  String? get five_set;
  @override
  @JsonKey(ignore: true)
  _$$SonataEffectEntityImplCopyWith<_$SonataEffectEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
