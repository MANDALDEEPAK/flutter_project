
import 'package:flutter_proj/features/todos/presentation/todo_form.dart';
import 'package:flutter_proj/features/todos/presentation/todo_list.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:go_router/go_router.dart';

class AppRoutes{

  static GoRouter get routes {
    return GoRouter(
      initialLocation: '/',
        routes: [

          GoRoute(
            path: '/',
            builder: (context,index) => TodoList(),
            routes: [
              GoRoute(
                  path: 'todo-form',
                  name:AppRoute.todoForm.name,
                builder: (context,state) => TodoForm(),
              ),
            ]

          )

            ],
    );
  }
}