import 'package:flutter_proj/models/book_models.dart';
import 'package:flutter_proj/pages/home_page.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{

  static GoRouter get routes {
    return GoRouter(
      initialLocation: '/',
        routes: [

          GoRoute(
            path: '/',
            pageBuilder: (context, state) {
              return NoTransitionPage(child: HomePage());
            }
          )

            ],
    );
  }
}