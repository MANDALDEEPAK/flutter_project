import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.g.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {

  const factory Product({
    required String title,
    required String description,
    required int price,
    required String image,
    required int rating,
    required String category,
    required String brand,
}) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
