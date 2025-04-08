

import 'package:uuid/uuid.dart';

class Todo {
  final String todo;
  final String id;
  final bool isCompleted;

  Todo({
    required this.todo,
    required this.id,
    required this.isCompleted
  });

  factory Todo.build(String todo){
    return Todo(todo: todo, id: Uuid().v4(), isCompleted: false);
  }

  Todo copyWith({String? todo,bool? isCompleted}){
    return Todo(todo: todo ?? this.todo, id: this.id, isCompleted: isCompleted ?? this.isCompleted);
  }
}

