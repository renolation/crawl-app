// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weapon_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeaponEntity _$WeaponEntityFromJson(Map<String, dynamic> json) {
  return _WeaponEntity.fromJson(json);
}

/// @nodoc
mixin _$WeaponEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get href => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  WeaponType? get type => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeaponEntityCopyWith<WeaponEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeaponEntityCopyWith<$Res> {
  factory $WeaponEntityCopyWith(
          WeaponEntity value, $Res Function(WeaponEntity) then) =
      _$WeaponEntityCopyWithImpl<$Res, WeaponEntity>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? href,
      int? rank,
      WeaponType? type,
      String? imageUrl});
}

/// @nodoc
class _$WeaponEntityCopyWithImpl<$Res, $Val extends WeaponEntity>
    implements $WeaponEntityCopyWith<$Res> {
  _$WeaponEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? href = freezed,
    Object? rank = freezed,
    Object? type = freezed,
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
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WeaponType?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeaponEntityImplCopyWith<$Res>
    implements $WeaponEntityCopyWith<$Res> {
  factory _$$WeaponEntityImplCopyWith(
          _$WeaponEntityImpl value, $Res Function(_$WeaponEntityImpl) then) =
      __$$WeaponEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? href,
      int? rank,
      WeaponType? type,
      String? imageUrl});
}

/// @nodoc
class __$$WeaponEntityImplCopyWithImpl<$Res>
    extends _$WeaponEntityCopyWithImpl<$Res, _$WeaponEntityImpl>
    implements _$$WeaponEntityImplCopyWith<$Res> {
  __$$WeaponEntityImplCopyWithImpl(
      _$WeaponEntityImpl _value, $Res Function(_$WeaponEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? href = freezed,
    Object? rank = freezed,
    Object? type = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$WeaponEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      href: freezed == href
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WeaponType?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeaponEntityImpl implements _WeaponEntity {
  const _$WeaponEntityImpl(
      {this.id, this.name, this.href, this.rank, this.type, this.imageUrl});

  factory _$WeaponEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeaponEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? href;
  @override
  final int? rank;
  @override
  final WeaponType? type;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'WeaponEntity(id: $id, name: $name, href: $href, rank: $rank, type: $type, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.href, href) || other.href == href) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, href, rank, type, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeaponEntityImplCopyWith<_$WeaponEntityImpl> get copyWith =>
      __$$WeaponEntityImplCopyWithImpl<_$WeaponEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeaponEntityImplToJson(
      this,
    );
  }
}

abstract class _WeaponEntity implements WeaponEntity {
  const factory _WeaponEntity(
      {final int? id,
      final String? name,
      final String? href,
      final int? rank,
      final WeaponType? type,
      final String? imageUrl}) = _$WeaponEntityImpl;

  factory _WeaponEntity.fromJson(Map<String, dynamic> json) =
      _$WeaponEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get href;
  @override
  int? get rank;
  @override
  WeaponType? get type;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$WeaponEntityImplCopyWith<_$WeaponEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
