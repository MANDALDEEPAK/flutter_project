

import 'package:flutter_proj/features/authentication/presentation/login.dart';
import 'package:flutter_proj/features/authentication/presentation/sign_up.dart';
import 'package:flutter_proj/features/home/presentation/home_page.dart';
import 'package:flutter_proj/features/shared/user_stream_provider.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_routes.g.dart';

@riverpod
GoRouter router (Ref ref) {
  final userState = ref.watch(userStreamProvider);
  return GoRouter(
    redirect: (context, state){
      final authenticated = userState.valueOrNull != null;
      final authenticating = (state.matchedLocation == '/login'  || state.matchedLocation == '/signup');
      if(authenticated == false){
        return authenticating ? null : '/login';
      }
      return null;
    },
      routes: [
        GoRoute(
            path: '/',
          pageBuilder: (context, state) {
              return NoTransitionPage(child: HomePage());
          }
        ),
        GoRoute(
            path: '/login',
            pageBuilder: (context, state) {
              return NoTransitionPage(child: Login());
            }
        ),
        GoRoute(
          path: '/signup',
          name: AppRoute.signup.name,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: SignUp());
          }
        )
      ]
  ) ;
}
