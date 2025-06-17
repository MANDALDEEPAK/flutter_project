// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getOrderHash() => r'c7eb2e5806b9deda097231366874babb4bf650d3';

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

/// See also [getOrder].
@ProviderFor(getOrder)
const getOrderProvider = GetOrderFamily();

/// See also [getOrder].
class GetOrderFamily extends Family<AsyncValue<Order>> {
  /// See also [getOrder].
  const GetOrderFamily();

  /// See also [getOrder].
  GetOrderProvider call({
    required String orderId,
  }) {
    return GetOrderProvider(
      orderId: orderId,
    );
  }

  @override
  GetOrderProvider getProviderOverride(
    covariant GetOrderProvider provider,
  ) {
    return call(
      orderId: provider.orderId,
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
  String? get name => r'getOrderProvider';
}

/// See also [getOrder].
class GetOrderProvider extends AutoDisposeFutureProvider<Order> {
  /// See also [getOrder].
  GetOrderProvider({
    required String orderId,
  }) : this._internal(
          (ref) => getOrder(
            ref as GetOrderRef,
            orderId: orderId,
          ),
          from: getOrderProvider,
          name: r'getOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOrderHash,
          dependencies: GetOrderFamily._dependencies,
          allTransitiveDependencies: GetOrderFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  GetOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final String orderId;

  @override
  Override overrideWith(
    FutureOr<Order> Function(GetOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOrderProvider._internal(
        (ref) => create(ref as GetOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Order> createElement() {
    return _GetOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOrderProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetOrderRef on AutoDisposeFutureProviderRef<Order> {
  /// The parameter `orderId` of this provider.
  String get orderId;
}

class _GetOrderProviderElement extends AutoDisposeFutureProviderElement<Order>
    with GetOrderRef {
  _GetOrderProviderElement(super.provider);

  @override
  String get orderId => (origin as GetOrderProvider).orderId;
}

String _$getOrdersHash() => r'3e8bae6338d992052cc949948fd9c13aebb049af';

/// See also [getOrders].
@ProviderFor(getOrders)
final getOrdersProvider = AutoDisposeFutureProvider<List<Order>>.internal(
  getOrders,
  name: r'getOrdersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getOrdersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetOrdersRef = AutoDisposeFutureProviderRef<List<Order>>;
String _$orderControllerHash() => r'cb9802e0a399b2f4ada5773883b29a27e9c6f3c5';

/// See also [OrderController].
@ProviderFor(OrderController)
final orderControllerProvider =
    AutoDisposeAsyncNotifierProvider<OrderController, void>.internal(
  OrderController.new,
  name: r'orderControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
