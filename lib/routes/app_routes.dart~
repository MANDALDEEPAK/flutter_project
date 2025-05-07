
import 'package:flutter/cupertino.dart';
import 'package:flutter_proj/features/meals/presentation/category_items.dart';
import 'package:flutter_proj/features/meals/presentation/meal_page.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{

  static GoRouter get routes {
    return GoRouter(
      initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => MealPage(),
            routes: [
              GoRoute(
                  path: '/category-items',
                  name: AppRoute.categoryItems.name,
                  builder: (context, state){
                    return CategoryItems(category: state.extra as String,);
    },
              ),

            ]

          )

            ],
    );
  }
}