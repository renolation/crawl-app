// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemEntity _$ItemEntityFromJson(Map<String, dynamic> json) {
  return _ItemEntity.fromJson(json);
}

/// @nodoc
mixin _$ItemEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get subTypes => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemEntityCopyWith<ItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEntityCopyWith<$Res> {
  factory $ItemEntityCopyWith(
          ItemEntity value, $Res Function(ItemEntity) then) =
      _$ItemEntityCopyWithImpl<$Res, ItemEntity>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? subTypes,
      String? description,
      int? rank,
      String? type,
      String? imageUrl});
}

/// @nodoc
class _$ItemEntityCopyWithImpl<$Res, $Val extends ItemEntity>
    implements $ItemEntityCopyWith<$Res> {
  _$ItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? subTypes = freezed,
    Object? description = freezed,
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
      subTypes: freezed == subTypes
          ? _value.subTypes
          : subTypes // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemEntityImplCopyWith<$Res>
    implements $ItemEntityCopyWith<$Res> {
  factory _$$ItemEntityImplCopyWith(
          _$ItemEntityImpl value, $Res Function(_$ItemEntityImpl) then) =
      __$$ItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? subTypes,
      String? description,
      int? rank,
      String? type,
      String? imageUrl});
}

/// @nodoc
class __$$ItemEntityImplCopyWithImpl<$Res>
    extends _$ItemEntityCopyWithImpl<$Res, _$ItemEntityImpl>
    implements _$$ItemEntityImplCopyWith<$Res> {
  __$$ItemEntityImplCopyWithImpl(
      _$ItemEntityImpl _value, $Res Function(_$ItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? subTypes = freezed,
    Object? description = freezed,
    Object? rank = freezed,
    Object? type = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$ItemEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      subTypes: freezed == subTypes
          ? _value.subTypes
          : subTypes // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
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
class _$ItemEntityImpl implements _ItemEntity {
  const _$ItemEntityImpl(
      {this.id,
      this.name,
      this.subTypes,
      this.description,
      this.rank,
      this.type,
      this.imageUrl});

  factory _$ItemEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? subTypes;
  @override
  final String? description;
  @override
  final int? rank;
  @override
  final String? type;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'ItemEntity(id: $id, name: $name, subTypes: $subTypes, description: $description, rank: $rank, type: $type, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.subTypes, subTypes) ||
                other.subTypes == subTypes) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, subTypes, description, rank, type, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemEntityImplCopyWith<_$ItemEntityImpl> get copyWith =>
      __$$ItemEntityImplCopyWithImpl<_$ItemEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemEntityImplToJson(
      this,
    );
  }
}

abstract class _ItemEntity implements ItemEntity {
  const factory _ItemEntity(
      {final int? id,
      final String? name,
      final String? subTypes,
      final String? description,
      final int? rank,
      final String? type,
      final String? imageUrl}) = _$ItemEntityImpl;

  factory _ItemEntity.fromJson(Map<String, dynamic> json) =
      _$ItemEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get subTypes;
  @override
  String? get description;
  @override
  int? get rank;
  @override
  String? get type;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$ItemEntityImplCopyWith<_$ItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
