import 'package:flutter_proj/models/book_models.dart';
import 'package:flutter_proj/pages/detail_page.dart';
import 'package:flutter_proj/pages/home_page.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{

  static GoRouter get routes {
    return GoRouter(
      initialLocation: '/',
        routes: [
          GoRoute(
        path:'/',
      builder: (context,state){
          return HomePage();
      },
            routes: [
              GoRoute(
                path: 'detail',
                name: AppRoute.details.name,
                builder: (context,state){
                  return DetailPage(book: state.extra as Book,);
                }
              )
            ],
    ),

    ]);
  }
}