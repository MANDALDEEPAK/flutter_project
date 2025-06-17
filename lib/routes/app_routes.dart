import 'package:flutter_proj/features/admin/presentation/admin_dashboard.dart';
import 'package:flutter_proj/features/admin/presentation/product_edit_form.dart';
import 'package:flutter_proj/features/admin/presentation/product_form.dart';
import 'package:flutter_proj/features/authentication/presentaion/login.dart';
import 'package:flutter_proj/features/authentication/presentaion/sign_up.dart';
import 'package:flutter_proj/features/carts/presentation/cart_page.dart';
import 'package:flutter_proj/features/home/presentation/home_page.dart';
import 'package:flutter_proj/features/orders/presentation/order_detail.dart';
import 'package:flutter_proj/features/orders/presentation/order_page.dart';
import 'package:flutter_proj/features/products/domain/product.dart';
import 'package:flutter_proj/features/products/presentation/product_detail.dart';
import 'package:flutter_proj/features/shared/user_state_provider.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';


@riverpod
GoRouter  router(Ref ref) {
  final userState = ref.watch(userStateProviderProvider);
  return  GoRouter(
    initialLocation: '/',
    redirect: (context, state){
      final authenticated = userState.token.isNotEmpty;
      final authenticating = (state.matchedLocation == '/login' || state.matchedLocation == '/signUp');
      if(authenticated == false){
        return authenticating ? null : '/login';
      }
      return null;
    },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state){
            return NoTransitionPage(child: HomePage());
          },
          routes: [
            GoRoute(
                path: 'productDetail',
                name: AppRoute.productDetail.name,
                pageBuilder: (context, state){
                  return NoTransitionPage(child: ProductDetail(id: state.extra as String));
                }
            ),

          ]
        ),
        GoRoute(
            path: '/cart',
            name: AppRoute.cart.name,
            pageBuilder: (context, state){
              return NoTransitionPage(child: CartPage());
            }
        ),

        GoRoute(
            path: '/order',
            name: AppRoute.order.name,
            pageBuilder: (context, state){
              return NoTransitionPage(child: const OrderPage());
            },

          routes: [
            GoRoute(
                path: 'order-detail',
                name: AppRoute.orderDetail.name,
                pageBuilder: (context, state){
                  return NoTransitionPage(child: OrderDetail(orderId: state.extra as String));
                }
            ),
          ]
        ),

        GoRoute(
            path: '/admin',
            name: AppRoute.admin.name,
            pageBuilder: (context, state){
              return NoTransitionPage(child: AdminDashboard());
            },
          routes: [
            GoRoute(
              path: 'productAdd',
                name: AppRoute.productAdd.name,
                pageBuilder: (context, state){
                  return NoTransitionPage(child: ProductForm());
                }
            ),
            GoRoute(
                path: 'productEdit',
                name: AppRoute.productEdit.name,
                pageBuilder: (context, state){
                  return NoTransitionPage(child: ProductEditForm(product: state.extra as Product));
                }
            )
          ]
        ),


        GoRoute(
            path: '/login',
            pageBuilder: (context, state){
              return NoTransitionPage(child: Login());
            }
        ),
        GoRoute(
            path: '/signUp',
            name: AppRoute.signup.name,
            pageBuilder: (context, state){
              return NoTransitionPage(child: SignUp());
            }
        ),


      ]
  );
}
