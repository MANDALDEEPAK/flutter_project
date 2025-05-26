import 'package:flutter_proj/features/admin/presentation/admin_dashboard.dart' show AdminDashboard;
import 'package:flutter_proj/features/admin/presentation/book_edit_form.dart' show BookEditForm;
import 'package:flutter_proj/features/admin/presentation/user_dashboard.dart' show UserDashboard;
import 'package:flutter_proj/features/admin/presentation/user_edit_form.dart' show UserEditForm;
import 'package:flutter_proj/features/authentication/presentaion/login.dart' show Login;
import 'package:flutter_proj/features/authentication/presentaion/sign_up.dart' show SignUp;
import 'package:flutter_proj/features/books/domain/book.dart' show Book;
import 'package:flutter_proj/features/books/presentation/book_detail.dart' show BookDetail;
import 'package:flutter_proj/features/books/presentation/book_form.dart' show BookForm;
import 'package:flutter_proj/features/home/domain/user_data.dart' show UserData;
import 'package:flutter_proj/features/home/presentation/home_page.dart' show HomePage;
import 'package:flutter_proj/features/pdf/pdf_page.dart' show PdfPage;
import 'package:flutter_proj/features/shared/user_stream_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'route_enums.dart' show AppRoute;

part 'app_routes.g.dart';


@riverpod
GoRouter  router(Ref ref) {
  final userState = ref.watch(userStreamProvider);
  return  GoRouter(
    redirect: (context, state){
      final authenticated = userState.valueOrNull !=null;
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
                path: 'book-detail',
              name: AppRoute.bookDetail.name,
              pageBuilder: (context, state){
                final book = state.extra as Book;
                return NoTransitionPage(child: BookDetail(book: book));
              },
            ),
            GoRoute(
              path: 'pdf',
              name: AppRoute.pdf.name,
              pageBuilder: (context, state){
                final bookUrl = state.extra as String;
                return NoTransitionPage(child: PdfPage(pdfUrl:bookUrl));
              },
            )
          ]
        ),

        GoRoute(
            path: '/admin',
            name: AppRoute.admin.name,
            pageBuilder: (context, state){
              return NoTransitionPage(child: AdminDashboard());
            }
        ),
        GoRoute(
            path: '/users',
            name: AppRoute.users.name,
            pageBuilder: (context, state){
              return NoTransitionPage(child: UserDashboard());
            }
        ),
        GoRoute(
            path: '/user-edit',
            name: AppRoute.userEdit.name,
            pageBuilder: (context, state){
              final user = state.extra as UserData;
              return NoTransitionPage(child: UserEditForm(user: user));
            }
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
        GoRoute(
            path: '/book-form',
            name: AppRoute.bookForm.name,
            pageBuilder: (context, state){
              return NoTransitionPage(child: BookForm());
            }
        ),
        GoRoute(
            path: '/book-edit',
            name: AppRoute.bookEdit.name,
            pageBuilder: (context, state){
              return NoTransitionPage(child: BookEditForm(book: state.extra as Book));
            }
        )
      ]
  );
}
