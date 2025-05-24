import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_proj/features/books/data/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/instance.dart';
import '../../data/domain/book.dart';

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
        price: price, publisher: publisher, author: author, description: description));
  }

  Future<void> updateBook ({
     File? file,
     XFile? image,
     String? imageUrl,
     String? fileUrl,
    required String title,
    required String genre,
    required int price,
    required String publisher,
    required String author,
    required String description,
    required String bookId,
  }) async{
   state = const AsyncLoading();
   state = await AsyncValue.guard(() => ref.read(bookRepoProvider).
   updateBook(
       file: file,
       image: image,
       imageUrl: imageUrl,
       fileUrl: fileUrl,
       title: title,
       genre: genre,
       price: price,
       publisher: publisher,
       author: author,
       description: description,
       bookId: bookId));

  }

}


@riverpod
Stream<List<Book>> bookModelStream(Ref ref) {
  return  ref.read(bookRepoProvider).getBooks();
}