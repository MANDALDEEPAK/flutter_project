import 'package:flutter/material.dart';
import 'package:flutter_proj/features/meals/presentation/controllers/meal_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryItems extends ConsumerWidget {
  final String category;
  const CategoryItems({super.key,required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealState = ref.watch(getMealItemsProvider(category: category));
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: mealState.when(
        data: (data) {
          return ListView.separated(
              itemBuilder: (context, index){
                final meal = data[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(meal.strMealThumb),
                  ),
                  title: Text(meal.strMeal),
                );
              },
              separatorBuilder: (context, index){
                return Divider();
              },
              itemCount: data.length);
        } ,
        error: (err, st) {
          return Center(
            child: Text(err.toString()),
          );
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        } ,
      ),
    );
  }
}