// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMealCategoryHash() => r'c65396af2f8015b8d03e7948d4abd8b837990286';

/// See also [getMealCategory].
@ProviderFor(getMealCategory)
final getMealCategoryProvider =
    AutoDisposeFutureProvider<List<CategoryData>>.internal(
      getMealCategory,
      name: r'getMealCategoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$getMealCategoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetMealCategoryRef = AutoDisposeFutureProviderRef<List<CategoryData>>;
String _$getMealItemsHash() => r'53442a6119d380576e11a4ab0e5227977483ded8';

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

/// See also [getMealItems].
@ProviderFor(getMealItems)
const getMealItemsProvider = GetMealItemsFamily();

/// See also [getMealItems].
class GetMealItemsFamily extends Family<AsyncValue<List<Meal>>> {
  /// See also [getMealItems].
  const GetMealItemsFamily();

  /// See also [getMealItems].
  GetMealItemsProvider call({required String category}) {
    return GetMealItemsProvider(category: category);
  }

  @override
  GetMealItemsProvider getProviderOverride(
    covariant GetMealItemsProvider provider,
  ) {
    return call(category: provider.category);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getMealItemsProvider';
}

/// See also [getMealItems].
class GetMealItemsProvider extends AutoDisposeFutureProvider<List<Meal>> {
  /// See also [getMealItems].
  GetMealItemsProvider({required String category})
    : this._internal(
        (ref) => getMealItems(ref as GetMealItemsRef, category: category),
        from: getMealItemsProvider,
        name: r'getMealItemsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$getMealItemsHash,
        dependencies: GetMealItemsFamily._dependencies,
        allTransitiveDependencies:
            GetMealItemsFamily._allTransitiveDependencies,
        category: category,
      );

  GetMealItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  Override overrideWith(
    FutureOr<List<Meal>> Function(GetMealItemsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMealItemsProvider._internal(
        (ref) => create(ref as GetMealItemsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Meal>> createElement() {
    return _GetMealItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMealItemsProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetMealItemsRef on AutoDisposeFutureProviderRef<List<Meal>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _GetMealItemsProviderElement
    extends AutoDisposeFutureProviderElement<List<Meal>>
    with GetMealItemsRef {
  _GetMealItemsProviderElement(super.provider);

  @override
  String get category => (origin as GetMealItemsProvider).category;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
