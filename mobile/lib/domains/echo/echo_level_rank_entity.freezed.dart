// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'echo_level_rank_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EchoLevelRankEntity _$EchoLevelRankEntityFromJson(Map<String, dynamic> json) {
  return _EchoLevelRankEntity.fromJson(json);
}

/// @nodoc
mixin _$EchoLevelRankEntity {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "level")
  int? get level => throw _privateConstructorUsedError;
  @JsonKey(name: "rank")
  int? get rank => throw _privateConstructorUsedError;
  @JsonKey(name: "echoMainStatEntity")
  EchoMainStatEntity? get echoMainStatEntity =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EchoLevelRankEntityCopyWith<EchoLevelRankEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EchoLevelRankEntityCopyWith<$Res> {
  factory $EchoLevelRankEntityCopyWith(
          EchoLevelRankEntity value, $Res Function(EchoLevelRankEntity) then) =
      _$EchoLevelRankEntityCopyWithImpl<$Res, EchoLevelRankEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "level") int? level,
      @JsonKey(name: "rank") int? rank,
      @JsonKey(name: "echoMainStatEntity")
      EchoMainStatEntity? echoMainStatEntity});

  $EchoMainStatEntityCopyWith<$Res>? get echoMainStatEntity;
}

/// @nodoc
class _$EchoLevelRankEntityCopyWithImpl<$Res, $Val extends EchoLevelRankEntity>
    implements $EchoLevelRankEntityCopyWith<$Res> {
  _$EchoLevelRankEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? level = freezed,
    Object? rank = freezed,
    Object? echoMainStatEntity = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      echoMainStatEntity: freezed == echoMainStatEntity
          ? _value.echoMainStatEntity
          : echoMainStatEntity // ignore: cast_nullable_to_non_nullable
              as EchoMainStatEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EchoMainStatEntityCopyWith<$Res>? get echoMainStatEntity {
    if (_value.echoMainStatEntity == null) {
      return null;
    }

    return $EchoMainStatEntityCopyWith<$Res>(_value.echoMainStatEntity!,
        (value) {
      return _then(_value.copyWith(echoMainStatEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EchoLevelRankEntityImplCopyWith<$Res>
    implements $EchoLevelRankEntityCopyWith<$Res> {
  factory _$$EchoLevelRankEntityImplCopyWith(_$EchoLevelRankEntityImpl value,
          $Res Function(_$EchoLevelRankEntityImpl) then) =
      __$$EchoLevelRankEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "level") int? level,
      @JsonKey(name: "rank") int? rank,
      @JsonKey(name: "echoMainStatEntity")
      EchoMainStatEntity? echoMainStatEntity});

  @override
  $EchoMainStatEntityCopyWith<$Res>? get echoMainStatEntity;
}

/// @nodoc
class __$$EchoLevelRankEntityImplCopyWithImpl<$Res>
    extends _$EchoLevelRankEntityCopyWithImpl<$Res, _$EchoLevelRankEntityImpl>
    implements _$$EchoLevelRankEntityImplCopyWith<$Res> {
  __$$EchoLevelRankEntityImplCopyWithImpl(_$EchoLevelRankEntityImpl _value,
      $Res Function(_$EchoLevelRankEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? level = freezed,
    Object? rank = freezed,
    Object? echoMainStatEntity = freezed,
  }) {
    return _then(_$EchoLevelRankEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      echoMainStatEntity: freezed == echoMainStatEntity
          ? _value.echoMainStatEntity
          : echoMainStatEntity // ignore: cast_nullable_to_non_nullable
              as EchoMainStatEntity?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EchoLevelRankEntityImpl implements _EchoLevelRankEntity {
  const _$EchoLevelRankEntityImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "level") this.level,
      @JsonKey(name: "rank") this.rank,
      @JsonKey(name: "echoMainStatEntity") this.echoMainStatEntity});

  factory _$EchoLevelRankEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EchoLevelRankEntityImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "level")
  final int? level;
  @override
  @JsonKey(name: "rank")
  final int? rank;
  @override
  @JsonKey(name: "echoMainStatEntity")
  final EchoMainStatEntity? echoMainStatEntity;

  @override
  String toString() {
    return 'EchoLevelRankEntity(id: $id, level: $level, rank: $rank, echoMainStatEntity: $echoMainStatEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EchoLevelRankEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.echoMainStatEntity, echoMainStatEntity) ||
                other.echoMainStatEntity == echoMainStatEntity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, level, rank, echoMainStatEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EchoLevelRankEntityImplCopyWith<_$EchoLevelRankEntityImpl> get copyWith =>
      __$$EchoLevelRankEntityImplCopyWithImpl<_$EchoLevelRankEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EchoLevelRankEntityImplToJson(
      this,
    );
  }
}

abstract class _EchoLevelRankEntity implements EchoLevelRankEntity {
  const factory _EchoLevelRankEntity(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "level") final int? level,
          @JsonKey(name: "rank") final int? rank,
          @JsonKey(name: "echoMainStatEntity")
          final EchoMainStatEntity? echoMainStatEntity}) =
      _$EchoLevelRankEntityImpl;

  factory _EchoLevelRankEntity.fromJson(Map<String, dynamic> json) =
      _$EchoLevelRankEntityImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "level")
  int? get level;
  @override
  @JsonKey(name: "rank")
  int? get rank;
  @override
  @JsonKey(name: "echoMainStatEntity")
  EchoMainStatEntity? get echoMainStatEntity;
  @override
  @JsonKey(ignore: true)
  _$$EchoLevelRankEntityImplCopyWith<_$EchoLevelRankEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
