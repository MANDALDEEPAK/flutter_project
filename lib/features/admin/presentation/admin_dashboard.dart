import 'package:flutter/material.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../books/presentation/controllers/book_controller.dart';

class AdminDashboard extends ConsumerWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookState = ref.watch(bookModelStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
              onPressed: (){
                context.pushNamed(AppRoute.bookForm.name);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: bookState.when(
          data: (data){
            return ListView.separated(
                itemBuilder: (context,index){
                  final book = data[index];
                  return ListTile(
                    onTap: (){
                      context.pushNamed(AppRoute.bookDetail.name,extra: book);
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(book.image),
                    ),
                    title: Text(book.title),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            context.pushNamed(AppRoute.bookEdit.name,extra: book);
                          }, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: const Text('Delete Book'),
                                content: const Text('Are you sure you want to delete this book?'),
                                actions: [
                                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Delete'))
                                ],
                              );
                            });
                          }, icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context,index) => const Divider(),
                itemCount: data.length
            );
          },
          error: (err,st) => Text(err.toString()),
          loading: () => const Center(child: CircularProgressIndicator(),)
      ),


    );
  }
}