// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookModelStreamHash() => r'76599d04d4c59c99c26b57457e27ea30f3738c4c';

/// See also [bookModelStream].
@ProviderFor(bookModelStream)
final bookModelStreamProvider = AutoDisposeStreamProvider<List<Book>>.internal(
  bookModelStream,
  name: r'bookModelStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$bookModelStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BookModelStreamRef = AutoDisposeStreamProviderRef<List<Book>>;
String _$bookControllerHash() => r'ead85c2f7b076db12e6bcfa6d3ea9cb185f2b761';

/// See also [BookController].
@ProviderFor(BookController)
final bookControllerProvider =
    AutoDisposeAsyncNotifierProvider<BookController, void>.internal(
      BookController.new,
      name: r'bookControllerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$bookControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BookController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
