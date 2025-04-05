import 'package:flutter/material.dart';
import 'package:flutter_proj/providers/notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final todoList = ref.watch(todoProvider);
    print(todoList);
    return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index){
            final todo = todoList[index];
            return Card(
              child: ListTile(
                title: Text(todo.todo),
              ),
            );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: todoList.length,
    );
  }
}
