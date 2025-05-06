import 'package:freezed_annotation/freezed_annotation.dart';
part 'meal.g.dart';

part 'meal.freezed.dart';


@freezed
class Meal with _$Meal {
  const factory Meal({
      @Default('') String idMeal,
      @Default('') String strMeal,
      @Default('') String strMealThumb,
}) = _Meal;


  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
}
