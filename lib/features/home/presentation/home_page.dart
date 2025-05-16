import 'package:flutter/material.dart';
import 'package:flutter_proj/features/books/presentation/book_list.dart';
import 'package:flutter_proj/features/home/presentation/widgets/widget_drawer.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/route_enums.dart';

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
         child:BookList(),
       ),
    );
  }
}
