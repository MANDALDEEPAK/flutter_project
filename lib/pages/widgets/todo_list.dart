import 'package:flutter/material.dart';
import 'package:flutter_proj/providers/notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final todoList = ref.watch(todoProvider);
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final data = todoList[index];
        return ListTile(
          subtitle: CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('is Completed'),
            value: data.isCompleted,
            dense: true,
            onChanged: (value) {
              ref.read(todoProvider.notifier).updateTodoCompleted(data.id);
            },
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          title: Text(data.todo),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: todoList.length,
    );
  }
}
