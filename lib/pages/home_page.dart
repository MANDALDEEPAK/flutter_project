import 'package:flutter/material.dart';
import 'package:flutter_proj/pages/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView(
        children: [

          TodoList(),

        ],
      ),
    );
  }
}
