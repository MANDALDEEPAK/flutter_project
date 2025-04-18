
import 'package:flutter_proj/features/products/presentation/product_list.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{

  static GoRouter get routes {
    return GoRouter(
      initialLocation: '/',
        routes: [

          GoRoute(
            path: '/',
            builder: (context, state) => ProductList()
          )

            ],
    );
  }
}