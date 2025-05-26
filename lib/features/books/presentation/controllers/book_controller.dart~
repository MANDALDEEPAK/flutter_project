import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magh/features/books/data/book_repository.dart';
import 'package:magh/features/books/domain/book.dart';
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
    required String description
}) async{
    state = const AsyncLoading();
    state  = await AsyncValue.guard(() => ref.read(bookRepoProvider).
    addBook(file: file, image: image, title: title, genre: genre,
        price: price, publisher: publisher, author: author,description: description));
  }

  Future<void> updateBook ({
    required File? file,
    required XFile? image,
    required String? imageUrl,
    required String? fileUrl,
    String? imageId,
    String? fileId,
    required String title,
    required String genre,
    required int price,
    required String publisher,
    required String author,
    required String description,
    required String bookId,
  }) async{
    state = const AsyncLoading();
    state  = await AsyncValue.guard(() => ref.read(bookRepoProvider).
    updateBook(file: file, image: image, title: title, genre: genre,
        fileUrl: fileUrl,
        imageUrl: imageUrl,
        fileId: fileId,
        imageId: imageId,
        price: price, publisher: publisher, author: author,description: description,bookId: bookId));

  }



}


@riverpod
Stream<List<Book>>  bookStream(Ref ref) {
  return ref.read(bookRepoProvider).getBooks();
}