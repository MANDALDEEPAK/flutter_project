import 'dart:io';

import 'package:flutter_proj/features/books/data/book_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_controller.g.dart';


@riverpod
class BookController extends _$BookController {
  @override
  FutureOr<void> build()  {}

  Future<void> addBook ({
    required File file,
    required XFile image,
    required String title,
    required String genre,
    required int price,
    required String publisher,
    required String author,
  }) async{
    state = const AsyncLoading();
    state  = await AsyncValue.guard(() => ref.read(bookRepoProvider).
    addBook(file: file, image: image, title: title, genre: genre,
        price: price, publisher: publisher, author: author));
  }
}
