import 'package:flutter/material.dart';
import 'package:flutter_proj/pages/widgets/todo_form.dart';
import 'package:flutter_proj/pages/widgets/todo_list.dart';
import 'package:flutter_proj/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          Consumer(
            builder: (context,ref,child){
              final themeState = ref.watch(themeProvider);
              return IconButton(onPressed: (){
                ref.read(themeProvider.notifier).toggle();
              }, icon: Icon(
                  themeState == true  ? Icons.light_mode_outlined : Icons.dark_mode_outlined));
              }
          )
        ],
      ),
      body: ListView(
        children: [

          TodoForm(),

          TodoList(),

        ],
      ),
    );
  }
}
