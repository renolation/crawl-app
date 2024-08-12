// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'echo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EchoEntity _$EchoEntityFromJson(Map<String, dynamic> json) {
  return _EchoEntity.fromJson(json);
}

/// @nodoc
mixin _$EchoEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get href => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get echoEntityClass => throw _privateConstructorUsedError;
  int? get cost => throw _privateConstructorUsedError;
  @JsonKey(name: "levelRanks")
  List<EchoLevelRankEntity>? get echoLevelRank =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "echoSubStat")
  EchoSubStat? get echoSubStat => throw _privateConstructorUsedError;
  @JsonKey(name: "echoAbility")
  List<EchoAbility>? get echoAbility => throw _privateConstructorUsedError;
  List<SonataEffectEntity>? get sonataEffects =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EchoEntityCopyWith<EchoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EchoEntityCopyWith<$Res> {
  factory $EchoEntityCopyWith(
          EchoEntity value, $Res Function(EchoEntity) then) =
      _$EchoEntityCopyWithImpl<$Res, EchoEntity>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? href,
      String? imageUrl,
      String? echoEntityClass,
      int? cost,
      @JsonKey(name: "levelRanks") List<EchoLevelRankEntity>? echoLevelRank,
      @JsonKey(name: "echoSubStat") EchoSubStat? echoSubStat,
      @JsonKey(name: "echoAbility") List<EchoAbility>? echoAbility,
      List<SonataEffectEntity>? sonataEffects});

  $EchoSubStatCopyWith<$Res>? get echoSubStat;
}

/// @nodoc
class _$EchoEntityCopyWithImpl<$Res, $Val extends EchoEntity>
    implements $EchoEntityCopyWith<$Res> {
  _$EchoEntityCopyWithImpl(this._value, this._then);

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
    Object? imageUrl = freezed,
    Object? echoEntityClass = freezed,
    Object? cost = freezed,
    Object? echoLevelRank = freezed,
    Object? echoSubStat = freezed,
    Object? echoAbility = freezed,
    Object? sonataEffects = freezed,
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      echoEntityClass: freezed == echoEntityClass
          ? _value.echoEntityClass
          : echoEntityClass // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      echoLevelRank: freezed == echoLevelRank
          ? _value.echoLevelRank
          : echoLevelRank // ignore: cast_nullable_to_non_nullable
              as List<EchoLevelRankEntity>?,
      echoSubStat: freezed == echoSubStat
          ? _value.echoSubStat
          : echoSubStat // ignore: cast_nullable_to_non_nullable
              as EchoSubStat?,
      echoAbility: freezed == echoAbility
          ? _value.echoAbility
          : echoAbility // ignore: cast_nullable_to_non_nullable
              as List<EchoAbility>?,
      sonataEffects: freezed == sonataEffects
          ? _value.sonataEffects
          : sonataEffects // ignore: cast_nullable_to_non_nullable
              as List<SonataEffectEntity>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EchoSubStatCopyWith<$Res>? get echoSubStat {
    if (_value.echoSubStat == null) {
      return null;
    }

    return $EchoSubStatCopyWith<$Res>(_value.echoSubStat!, (value) {
      return _then(_value.copyWith(echoSubStat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EchoEntityImplCopyWith<$Res>
    implements $EchoEntityCopyWith<$Res> {
  factory _$$EchoEntityImplCopyWith(
          _$EchoEntityImpl value, $Res Function(_$EchoEntityImpl) then) =
      __$$EchoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? href,
      String? imageUrl,
      String? echoEntityClass,
      int? cost,
      @JsonKey(name: "levelRanks") List<EchoLevelRankEntity>? echoLevelRank,
      @JsonKey(name: "echoSubStat") EchoSubStat? echoSubStat,
      @JsonKey(name: "echoAbility") List<EchoAbility>? echoAbility,
      List<SonataEffectEntity>? sonataEffects});

  @override
  $EchoSubStatCopyWith<$Res>? get echoSubStat;
}

/// @nodoc
class __$$EchoEntityImplCopyWithImpl<$Res>
    extends _$EchoEntityCopyWithImpl<$Res, _$EchoEntityImpl>
    implements _$$EchoEntityImplCopyWith<$Res> {
  __$$EchoEntityImplCopyWithImpl(
      _$EchoEntityImpl _value, $Res Function(_$EchoEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? href = freezed,
    Object? imageUrl = freezed,
    Object? echoEntityClass = freezed,
    Object? cost = freezed,
    Object? echoLevelRank = freezed,
    Object? echoSubStat = freezed,
    Object? echoAbility = freezed,
    Object? sonataEffects = freezed,
  }) {
    return _then(_$EchoEntityImpl(
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
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      echoEntityClass: freezed == echoEntityClass
          ? _value.echoEntityClass
          : echoEntityClass // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as int?,
      echoLevelRank: freezed == echoLevelRank
          ? _value._echoLevelRank
          : echoLevelRank // ignore: cast_nullable_to_non_nullable
              as List<EchoLevelRankEntity>?,
      echoSubStat: freezed == echoSubStat
          ? _value.echoSubStat
          : echoSubStat // ignore: cast_nullable_to_non_nullable
              as EchoSubStat?,
      echoAbility: freezed == echoAbility
          ? _value._echoAbility
          : echoAbility // ignore: cast_nullable_to_non_nullable
              as List<EchoAbility>?,
      sonataEffects: freezed == sonataEffects
          ? _value._sonataEffects
          : sonataEffects // ignore: cast_nullable_to_non_nullable
              as List<SonataEffectEntity>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EchoEntityImpl implements _EchoEntity {
  const _$EchoEntityImpl(
      {this.id,
      this.name,
      this.href,
      this.imageUrl,
      this.echoEntityClass,
      this.cost,
      @JsonKey(name: "levelRanks")
      final List<EchoLevelRankEntity>? echoLevelRank,
      @JsonKey(name: "echoSubStat") this.echoSubStat,
      @JsonKey(name: "echoAbility") final List<EchoAbility>? echoAbility,
      final List<SonataEffectEntity>? sonataEffects})
      : _echoLevelRank = echoLevelRank,
        _echoAbility = echoAbility,
        _sonataEffects = sonataEffects;

  factory _$EchoEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EchoEntityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? href;
  @override
  final String? imageUrl;
  @override
  final String? echoEntityClass;
  @override
  final int? cost;
  final List<EchoLevelRankEntity>? _echoLevelRank;
  @override
  @JsonKey(name: "levelRanks")
  List<EchoLevelRankEntity>? get echoLevelRank {
    final value = _echoLevelRank;
    if (value == null) return null;
    if (_echoLevelRank is EqualUnmodifiableListView) return _echoLevelRank;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "echoSubStat")
  final EchoSubStat? echoSubStat;
  final List<EchoAbility>? _echoAbility;
  @override
  @JsonKey(name: "echoAbility")
  List<EchoAbility>? get echoAbility {
    final value = _echoAbility;
    if (value == null) return null;
    if (_echoAbility is EqualUnmodifiableListView) return _echoAbility;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SonataEffectEntity>? _sonataEffects;
  @override
  List<SonataEffectEntity>? get sonataEffects {
    final value = _sonataEffects;
    if (value == null) return null;
    if (_sonataEffects is EqualUnmodifiableListView) return _sonataEffects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EchoEntity(id: $id, name: $name, href: $href, imageUrl: $imageUrl, echoEntityClass: $echoEntityClass, cost: $cost, echoLevelRank: $echoLevelRank, echoSubStat: $echoSubStat, echoAbility: $echoAbility, sonataEffects: $sonataEffects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EchoEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.href, href) || other.href == href) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.echoEntityClass, echoEntityClass) ||
                other.echoEntityClass == echoEntityClass) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            const DeepCollectionEquality()
                .equals(other._echoLevelRank, _echoLevelRank) &&
            (identical(other.echoSubStat, echoSubStat) ||
                other.echoSubStat == echoSubStat) &&
            const DeepCollectionEquality()
                .equals(other._echoAbility, _echoAbility) &&
            const DeepCollectionEquality()
                .equals(other._sonataEffects, _sonataEffects));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      href,
      imageUrl,
      echoEntityClass,
      cost,
      const DeepCollectionEquality().hash(_echoLevelRank),
      echoSubStat,
      const DeepCollectionEquality().hash(_echoAbility),
      const DeepCollectionEquality().hash(_sonataEffects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EchoEntityImplCopyWith<_$EchoEntityImpl> get copyWith =>
      __$$EchoEntityImplCopyWithImpl<_$EchoEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EchoEntityImplToJson(
      this,
    );
  }
}

abstract class _EchoEntity implements EchoEntity {
  const factory _EchoEntity(
      {final int? id,
      final String? name,
      final String? href,
      final String? imageUrl,
      final String? echoEntityClass,
      final int? cost,
      @JsonKey(name: "levelRanks")
      final List<EchoLevelRankEntity>? echoLevelRank,
      @JsonKey(name: "echoSubStat") final EchoSubStat? echoSubStat,
      @JsonKey(name: "echoAbility") final List<EchoAbility>? echoAbility,
      final List<SonataEffectEntity>? sonataEffects}) = _$EchoEntityImpl;

  factory _EchoEntity.fromJson(Map<String, dynamic> json) =
      _$EchoEntityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get href;
  @override
  String? get imageUrl;
  @override
  String? get echoEntityClass;
  @override
  int? get cost;
  @override
  @JsonKey(name: "levelRanks")
  List<EchoLevelRankEntity>? get echoLevelRank;
  @override
  @JsonKey(name: "echoSubStat")
  EchoSubStat? get echoSubStat;
  @override
  @JsonKey(name: "echoAbility")
  List<EchoAbility>? get echoAbility;
  @override
  List<SonataEffectEntity>? get sonataEffects;
  @override
  @JsonKey(ignore: true)
  _$$EchoEntityImplCopyWith<_$EchoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
