import 'package:flutter_proj/features/todos/data/todo_repository.dart';
import 'package:flutter_proj/features/todos/domain/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'todo_controller.g.dart';


@riverpod
class TodoController extends _$TodoController {
  @override
  FutureOr<List<Todo>> build()async{
    return ref.read(todosRepositoryProvider).getTodos();

  }

  Future<void> removeTodo(String id)async{
    state = AsyncLoading();
    try{
      final response = await ref.read(todosRepositoryProvider).removeTodos(id:id);
      ref.invalidateSelf();

    }catch(err, stack){
       state = AsyncError(err, stack);
    }
  }


}
