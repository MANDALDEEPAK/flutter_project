import 'package:dio/dio.dart';
import 'package:flutter_proj/features/recipes/domain/recipe.dart';


class RecipeRepository{

  final dio = Dio();
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