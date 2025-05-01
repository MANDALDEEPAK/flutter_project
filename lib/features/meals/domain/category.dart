import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.g.dart';

part 'category.freezed.dart';


@freezed
class CategoryData with _$CategoryData {
  const factory CategoryData({
    required String idCategory,
    required String strCategory,
    required String strCategoryThumb,
    required String strCategoryDescription

}) = _CategoryData;
  factory CategoryData.fromJson(Map<String,dynamic>json) => _$CategoryDataFromJson(json);
}
