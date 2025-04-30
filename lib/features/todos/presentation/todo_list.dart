import 'package:flutter/material.dart';
import 'package:flutter_proj/core/app_theme/app_sizes.dart';
import 'package:flutter_proj/features/todos/presentation/controllers/todo_controller.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    
    ref.listen(todoControllerProvider, (previous, next){
      next.maybeWhen(
        data: (data) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sucesss'))),
        error: (err,stack){
          SnackBar(content: Text('$err'),);
        },orElse: () => null,
      );
    });
    final todoState = ref.watch(todoControllerProvider);

     /*
     3sec
     AsyncLoading<String>
     isLoading: true,
     isRefreshing: false,
     isReloading: false,
     isValue: false,
     hasError: false,
     value: null,
     error: null

     3 sec pachi

     AsyncData<String>
     isLoading: false,
     isRefreshing: false,
     isReloading: false,
     isValue: true,
     hasError: false,
     value: 'data response',
     error: null
      */
    print('${todoState}isLoading: ${todoState.isLoading}');
    print('${todoState}isRefreshing: ${todoState.isRefreshing}');
    print('${todoState}isReloading: ${todoState.isReloading}');
    print('${todoState}isValue: ${todoState.hasValue}');
    print('${todoState}hasError: ${todoState.hasError}');
    print('${todoState}value: ${todoState.value}');
    print('${todoState}error: ${todoState.error}');


    print('===============================================');

    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(onPressed: (){
            context.pushNamed(AppRoute.todoForm.name);
          }, child: Text('Add Todo')),
        ],

      ),
      body: Center(
        child: todoState.when(
          skipLoadingOnReload: true,
            data: (data){
          return ListView.separated(
              itemBuilder: (context, index){
                final todo = data[index];
                return ListTile(
                  title: Text(todo.todo_task),
                  trailing:todoState.isReloading && todoIndex == index ? CircularProgressIndicator():
                  IconButton(onPressed: (){
                    ref.read(todoControllerProvider.notifier).removeTodo(todo.id,index);
                  }, icon: Icon(Icons.delete)),
                );
              },
              separatorBuilder: (context, index){
                return Divider();
              },
              itemCount: data.length
          );
            },
            error: (err,st)=>Text('$err'),
            loading: () => CircularProgressIndicator()),
      ),
    ) ;
  }
}