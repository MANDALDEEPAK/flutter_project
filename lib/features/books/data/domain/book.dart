import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.g.dart';

part 'book.freezed.dart';


@freezed
class Book with _$Book {
  const factory Book({
    required String id,
    required String title,
    required String description,
    required String genre,
    required String author,
    required String publisher,
    required int price,
    required String image,
    required String file,
}) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) =>
      _$BookFromJson(json);
}