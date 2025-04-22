import 'package:flutter/material.dart';
import 'package:flutter_proj/features/recipes/presentation/controllers/recipe_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';


class Recipes extends ConsumerWidget {
  const Recipes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeState = ref.watch(getRecipeProvider);
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: recipeState.when(
            data: (data){
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                  mainAxisExtent: 250,
                  crossAxisSpacing: 20),
                  itemCount: data.length,
                  itemBuilder: (context,index){
                    final recipe = data[index];
                    return Column(
                      children: [
                        Text(recipe.cuisine),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(imageUrl:recipe.image,fit: BoxFit.cover,)),
                      ],
                    );
                  },
              );
            },
            error: (err,stack) => Text('$err'),
            loading: () => Center(child: CircularProgressIndicator()),
        ),
    ) ;
  }
}