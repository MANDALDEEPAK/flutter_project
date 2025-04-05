import 'package:flutter_proj/models/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoProvider extends Notifier<List<Todo>>{
  // List <Todo>
  @override
 List<Todo> build() {
    return [Todo.build('Deepak')];

  }

  void addTodo(String todo){
    state = [...state,Todo.build(todo)];
  }

}

final todoProvider = NotifierProvider<TodoProvider,List<Todo>>(() => TodoProvider());