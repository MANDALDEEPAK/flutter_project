import 'package:flutter/material.dart';
import 'package:flutter_proj/routes/route_enums.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'controllers/meal_controller.dart';

class MealPage extends ConsumerWidget {
  const MealPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealState = ref.watch(getMealCategoryProvider);
    return Scaffold(
      appBar: AppBar(),
        body: mealState.when(
            data: (data){
              return ListView.separated(
                  itemBuilder: (context, index){
                    final category = data[index];
                    return ListTile(
                      onTap: (){
                        context.pushNamed(AppRoute.categoryItems.name, extra: category.strCategory);
                      },
                      title: Text(category.strCategory),
                    );
                  },
                  separatorBuilder: (context, index){
                    return Divider();
                  },
                  itemCount: data.length
              );
            },
            error: (err, st){
              // print(st);
              return Center(
                child: HtmlWidget(
                  err.toString(),
                ),

              );
            },
            loading: () => Skeletonizer(
               child: ListView.separated(
                   itemBuilder: (context, index){
                     return ListTile(
                       title: Text('miscellaneous'),
                     );
                   },
                   separatorBuilder: (context, index){
                     return Divider();
                   },
                   itemCount: 10
               ),
            ),
        )
    );
  }
}