import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/meal_repository.dart';
import '../../domain/category.dart';
part 'meal_controller.g.dart';


@riverpod
Future<List<CategoryData>> getMealCategory(Ref ref) async {
  return ref.read(mealRepositoryProvider).getCategories();
}