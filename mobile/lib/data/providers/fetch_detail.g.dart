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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
