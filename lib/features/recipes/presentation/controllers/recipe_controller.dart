import 'package:flutter_proj/features/recipes/data/recipe_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/recipe.dart';

part 'recipe_controller.g.dart';

@riverpod
Future<List<Recipe>> getRecipe(Ref ref) async {
  return RecipeRepository().getRecipes();
}
