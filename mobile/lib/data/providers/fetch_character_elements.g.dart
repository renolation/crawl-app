// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_character_elements.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchCharacterElementsHash() =>
    r'1080298fc5ea65af82d6ce04302f297e626c9071';

/// See also [fetchCharacterElements].
@ProviderFor(fetchCharacterElements)
final fetchCharacterElementsProvider =
    FutureProvider<List<CharacterElementEntity>>.internal(
  fetchCharacterElements,
  name: r'fetchCharacterElementsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchCharacterElementsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchCharacterElementsRef
    = FutureProviderRef<List<CharacterElementEntity>>;
String _$fetchEchoesHash() => r'ec113dbc05636c84d1efc78cb736a90af00b610f';

/// See also [fetchEchoes].
@ProviderFor(fetchEchoes)
final fetchEchoesProvider = FutureProvider<List<EchoEntity>>.internal(
  fetchEchoes,
  name: r'fetchEchoesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchEchoesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchEchoesRef = FutureProviderRef<List<EchoEntity>>;
String _$fetchWeaponsHash() => r'75a7de5e687cb007cdd2b0ce1618a846bdde927a';

/// See also [fetchWeapons].
@ProviderFor(fetchWeapons)
final fetchWeaponsProvider = FutureProvider<List<WeaponEntity>>.internal(
  fetchWeapons,
  name: r'fetchWeaponsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchWeaponsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchWeaponsRef = FutureProviderRef<List<WeaponEntity>>;
String _$fetchItemsHash() => r'd39daf32a2a1573158f57013e444273b4a164666';

/// See also [fetchItems].
@ProviderFor(fetchItems)
final fetchItemsProvider = FutureProvider<List<ItemEntity>>.internal(
  fetchItems,
  name: r'fetchItemsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchItemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchItemsRef = FutureProviderRef<List<ItemEntity>>;
String _$fetchWeaponByIdHash() => r'4713a3ca845626e4d86aad48eb6c6c78886524e1';

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
  FetchWeaponByIdProvider call(
    String id,
  ) {
    return FetchWeaponByIdProvider(
      id,
    );
  }

  @override
  FetchWeaponByIdProvider getProviderOverride(
    covariant FetchWeaponByIdProvider provider,
  ) {
    return call(
      provider.id,
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
  FetchWeaponByIdProvider(
    String id,
  ) : this._internal(
          (ref) => fetchWeaponById(
            ref as FetchWeaponByIdRef,
            id,
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

  final String id;

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
  String get id;
}

class _FetchWeaponByIdProviderElement
    extends FutureProviderElement<WeaponEntity> with FetchWeaponByIdRef {
  _FetchWeaponByIdProviderElement(super.provider);

  @override
  String get id => (origin as FetchWeaponByIdProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
