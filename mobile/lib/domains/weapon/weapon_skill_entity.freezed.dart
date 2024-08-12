// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weapon_skill_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeaponSkillEntity _$WeaponSkillEntityFromJson(Map<String, dynamic> json) {
  return _WeaponSkillEntity.fromJson(json);
}

/// @nodoc
mixin _$WeaponSkillEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeaponSkillEntityCopyWith<WeaponSkillEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeaponSkillEntityCopyWith<$Res> {
  factory $WeaponSkillEntityCopyWith(
          WeaponSkillEntity value, $Res Function(WeaponSkillEntity) then) =
      _$WeaponSkillEntityCopyWithImpl<$Res, WeaponSkillEntity>;
  @useResult
  $Res call({int? id, String? name, String? value});
}

/// @nodoc
class _$WeaponSkillEntityCopyWithImpl<$Res, $Val extends WeaponSkillEntity>
    implements $WeaponSkillEntityCopyWith<$Res> {
  _$WeaponSkillEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? value = freezed,
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
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeaponSkillEntityImplCopyWith<$Res>
    implements $WeaponSkillEntityCopyWith<$Res> {
  factory _$$WeaponSkillEntityImplCopyWith(_$WeaponSkillEntityImpl value,
          $Res Function(_$WeaponSkillEntityImpl) then) =
      __$$WeaponSkillEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? value});
}

/// @nodoc
class __$$WeaponSkillEntityImplCopyWithImpl<$Res>
    extends _$WeaponSkillEntityCopyWithImpl<$Res, _$WeaponSkillEntityImpl>
    implements _$$WeaponSkillEntityImplCopyWith<$Res> {
  __$$WeaponSkillEntityImplCopyWithImpl(_$WeaponSkillEntityImpl _value,
      $Res Function(_$WeaponSkillEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? value = freezed,
  }) {
    return _then(_$WeaponSkillEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeaponSkillEntityImpl implements _WeaponSkillEntity {
  const _$WeaponSkillEntityImpl({this.id, this.name, this.value});

  factory _$WeaponSkillEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeaponSkillEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? value;

  @override
  String toString() {
    return 'WeaponSkillEntity(id: $id, name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeaponSkillEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeaponSkillEntityImplCopyWith<_$WeaponSkillEntityImpl> get copyWith =>
      __$$WeaponSkillEntityImplCopyWithImpl<_$WeaponSkillEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeaponSkillEntityImplToJson(
      this,
    );
  }
}

abstract class _WeaponSkillEntity implements WeaponSkillEntity {
  const factory _WeaponSkillEntity(
      {final int? id,
      final String? name,
      final String? value}) = _$WeaponSkillEntityImpl;

  factory _WeaponSkillEntity.fromJson(Map<String, dynamic> json) =
      _$WeaponSkillEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$WeaponSkillEntityImplCopyWith<_$WeaponSkillEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
