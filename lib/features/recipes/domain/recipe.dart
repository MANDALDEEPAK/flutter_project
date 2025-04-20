import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';


@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    required String name,
    @Default([]) List<String> ingredients,
    @Default([]) List<String> instructions,
    @Default('not-available') String cuisine,
    @Default('not-available') String image,

}) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}


