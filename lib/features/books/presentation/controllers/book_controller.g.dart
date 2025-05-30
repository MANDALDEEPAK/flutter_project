// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookStreamHash() => r'f8e5a78d1211a9e68fef801e2ef655c7c9592bc6';

/// See also [bookStream].
@ProviderFor(bookStream)
final bookStreamProvider = AutoDisposeStreamProvider<List<Book>>.internal(
  bookStream,
  name: r'bookStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bookStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BookStreamRef = AutoDisposeStreamProviderRef<List<Book>>;
String _$bookControllerHash() => r'26debc0af9a2f4193b417843459167570a88b319';

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
