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

  void updateTodoCompleted(String id){
    state = [
      for(final todo in state) todo.id == id ? todo.copyWith(isCompleted: !todo.isCompleted): todo
    ];
  }
  void updateTodo(String id,String label){
    state = [
      for(final todo in state) todo.id == id ? todo.copyWith(todo: label): todo
    ];
  }
}

final todoProvider = NotifierProvider<TodoProvider,List<Todo>>(() => TodoProvider());