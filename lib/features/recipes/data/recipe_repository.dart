import 'package:dio/dio.dart';
import 'package:flutter_proj/features/recipes/domain/recipe.dart';
import 'package:flutter_proj/features/shared/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'recipe_repository.g.dart';


class RecipeRepository{

  final Dio dio;
  RecipeRepository(this.dio);
  Future<List<Recipe>> getRecipes()  async{
    try{
      final response = await dio.get('https://dummyjson.com/recipes');
      return (response.data['recipes'] as List).map((recipe){
            return Recipe.fromJson(recipe);
      }).toList();

    }catch(err){
      throw 'Something went wrong';

    }
  }
}

@riverpod
RecipeRepository recipeRepository (Ref ref) {
  return RecipeRepository(ref.watch(clientProvider));
}