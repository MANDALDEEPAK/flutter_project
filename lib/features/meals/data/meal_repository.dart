
import 'package:dio/dio.dart';
import 'package:flutter_proj/core/contants/apis.dart';
import 'package:flutter_proj/core/exception/api_exception.dart';
import 'package:flutter_proj/features/meals/domain/category.dart';
import 'package:flutter_proj/features/meals/domain/meal.dart';
import 'package:flutter_proj/features/shared/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'meal_repository.g.dart';


class MealRepository{
  final Dio client;
  MealRepository(this.client);

  Future<List<CategoryData>> getCategories() async{
    try{
      final response = await client.get(categoriesApi);
      return (response.data['categories'] as List).map((e) => CategoryData.fromJson(e)).toList();

    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }

  Future<List<Meal>> getMealItems({required String category}) async{
    try{
      final response = await client.get(filterApi,queryParameters: {
        'c' : category
      });
      return (response.data['meals'] as List).map((e) => Meal.fromJson(e)).toList();

    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }
}


@riverpod
MealRepository mealRepository (Ref ref) {
  return MealRepository(ref.watch(clientProvider));
}