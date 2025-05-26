import 'package:flutter/material.dart';
import 'package:flutter_proj/features/books/presentation/book_list.dart' show BookList;
import 'package:flutter_proj/routes/route_enums.dart' show AppRoute;
import 'package:go_router/go_router.dart';

import 'widgets/drawer_widget.dart' show DrawerWidget;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text('Booking App'),
        actions: [
          IconButton(onPressed: (){
            context.pushNamed(AppRoute.bookForm.name);
          }, icon: const Icon(Icons.add)),
        ],
      ),

      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BookList()
      ),
    );
  }
}
