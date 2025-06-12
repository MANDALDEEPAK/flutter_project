import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.g.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {

  const factory Product({
    required String title,
    @JsonKey(name: '_id') @Default('')  String id,
    @Default('') String description,
    @Default(0) int price,
    @Default('') String image,
    @Default(0) int rating,
    @Default('') String category,
    @Default('') String brand,
}) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
