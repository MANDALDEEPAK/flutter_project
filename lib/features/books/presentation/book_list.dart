import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/features/shared/instances.dart' show FirebaseInstances;
import 'package:flutter_proj/routes/route_enums.dart' show AppRoute;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


import 'controllers/book_controller.dart';

class BookList extends ConsumerWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = FirebaseInstances.fireAuth.currentUser!.uid;
    final bookState = ref.watch(bookStreamProvider);
    return bookState.when(data: (data){
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final book = data[index];
            return MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                context.pushNamed(AppRoute.bookDetail.name, extra: book);
              },
              child: Card(
                child: Column(
                  children: [
                  if(userId == book.userId)  Align(
                        alignment: Alignment.topRight,
                        child: IconButton(onPressed: (){
                          context.pushNamed(AppRoute.bookEdit.name, extra: book);
                        }, icon: Icon(Icons.edit))),
                    CachedNetworkImage(
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: book.imageUrl),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(

                        children: [
                          Text(book.title),
                          Text('Author:-${book.author}'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );

          }
      );
    },
        error: (err, st)=> Text(err.toString()),
        loading: () => const Center(child: CircularProgressIndicator(),)
    );
  }
}