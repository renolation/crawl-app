// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_detail.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchWeaponByIdHash() => r'7cd9a35354d988d586dea2a8b8229cae07372899';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchWeaponById].
@ProviderFor(fetchWeaponById)
const fetchWeaponByIdProvider = FetchWeaponByIdFamily();

/// See also [fetchWeaponById].
class FetchWeaponByIdFamily extends Family<AsyncValue<WeaponEntity>> {
  /// See also [fetchWeaponById].
  const FetchWeaponByIdFamily();

  /// See also [fetchWeaponById].
  FetchWeaponByIdProvider call({
    required int id,
  }) {
    return FetchWeaponByIdProvider(
      id: id,
    );
  }

  @override
  FetchWeaponByIdProvider getProviderOverride(
    covariant FetchWeaponByIdProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchWeaponByIdProvider';
}

/// See also [fetchWeaponById].
class FetchWeaponByIdProvider extends FutureProvider<WeaponEntity> {
  /// See also [fetchWeaponById].
  FetchWeaponByIdProvider({
    required int id,
  }) : this._internal(
          (ref) => fetchWeaponById(
            ref as FetchWeaponByIdRef,
            id: id,
          ),
          from: fetchWeaponByIdProvider,
          name: r'fetchWeaponByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchWeaponByIdHash,
          dependencies: FetchWeaponByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchWeaponByIdFamily._allTransitiveDependencies,
          id: id,
        );

  FetchWeaponByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<WeaponEntity> Function(FetchWeaponByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchWeaponByIdProvider._internal(
        (ref) => create(ref as FetchWeaponByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<WeaponEntity> createElement() {
    return _FetchWeaponByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchWeaponByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchWeaponByIdRef on FutureProviderRef<WeaponEntity> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchWeaponByIdProviderElement
    extends FutureProviderElement<WeaponEntity> with FetchWeaponByIdRef {
  _FetchWeaponByIdProviderElement(super.provider);

  @override
  int get id => (origin as FetchWeaponByIdProvider).id;
}

String _$fetchEchoByIdHash() => r'3f5154c26e768e5a758e8181ee38cfd44752d399';

/// See also [fetchEchoById].
@ProviderFor(fetchEchoById)
const fetchEchoByIdProvider = FetchEchoByIdFamily();

/// See also [fetchEchoById].
class FetchEchoByIdFamily extends Family<AsyncValue<EchoEntity>> {
  /// See also [fetchEchoById].
  const FetchEchoByIdFamily();

  /// See also [fetchEchoById].
  FetchEchoByIdProvider call({
    required int id,
  }) {
    return FetchEchoByIdProvider(
      id: id,
    );
  }

  @override
  FetchEchoByIdProvider getProviderOverride(
    covariant FetchEchoByIdProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchEchoByIdProvider';
}

/// See also [fetchEchoById].
class FetchEchoByIdProvider extends FutureProvider<EchoEntity> {
  /// See also [fetchEchoById].
  FetchEchoByIdProvider({
    required int id,
  }) : this._internal(
          (ref) => fetchEchoById(
            ref as FetchEchoByIdRef,
            id: id,
          ),
          from: fetchEchoByIdProvider,
          name: r'fetchEchoByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchEchoByIdHash,
          dependencies: FetchEchoByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchEchoByIdFamily._allTransitiveDependencies,
          id: id,
        );

  FetchEchoByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<EchoEntity> Function(FetchEchoByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchEchoByIdProvider._internal(
        (ref) => create(ref as FetchEchoByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<EchoEntity> createElement() {
    return _FetchEchoByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEchoByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchEchoByIdRef on FutureProviderRef<EchoEntity> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchEchoByIdProviderElement extends FutureProviderElement<EchoEntity>
    with FetchEchoByIdRef {
  _FetchEchoByIdProviderElement(super.provider);

  @override
  int get id => (origin as FetchEchoByIdProvider).id;
}

String _$fetchCharacterByIdHash() =>
    r'3a7211d6d179878dfdf1690a302bd8804a801476';

/// See also [fetchCharacterById].
@ProviderFor(fetchCharacterById)
const fetchCharacterByIdProvider = FetchCharacterByIdFamily();

/// See also [fetchCharacterById].
class FetchCharacterByIdFamily extends Family<AsyncValue<CharacterEntity>> {
  /// See also [fetchCharacterById].
  const FetchCharacterByIdFamily();

  /// See also [fetchCharacterById].
  FetchCharacterByIdProvider call({
    required int id,
  }) {
    return FetchCharacterByIdProvider(
      id: id,
    );
  }

  @override
  FetchCharacterByIdProvider getProviderOverride(
    covariant FetchCharacterByIdProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchCharacterByIdProvider';
}

/// See also [fetchCharacterById].
class FetchCharacterByIdProvider extends FutureProvider<CharacterEntity> {
  /// See also [fetchCharacterById].
  FetchCharacterByIdProvider({
    required int id,
  }) : this._internal(
          (ref) => fetchCharacterById(
            ref as FetchCharacterByIdRef,
            id: id,
          ),
          from: fetchCharacterByIdProvider,
          name: r'fetchCharacterByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCharacterByIdHash,
          dependencies: FetchCharacterByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchCharacterByIdFamily._allTransitiveDependencies,
          id: id,
        );

  FetchCharacterByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<CharacterEntity> Function(FetchCharacterByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCharacterByIdProvider._internal(
        (ref) => create(ref as FetchCharacterByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<CharacterEntity> createElement() {
    return _FetchCharacterByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCharacterByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCharacterByIdRef on FutureProviderRef<CharacterEntity> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchCharacterByIdProviderElement
    extends FutureProviderElement<CharacterEntity> with FetchCharacterByIdRef {
  _FetchCharacterByIdProviderElement(super.provider);

  @override
  int get id => (origin as FetchCharacterByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
