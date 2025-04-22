import 'package:flutter/material.dart';
import 'package:flutter_proj/features/posts/presentation/controllers/post_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Posts extends ConsumerWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(getPostsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('List Of Posts'),
      ),
      body: postState.when(
          data: (data){
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                ),
                itemCount: data.length,
                itemBuilder: (context,index){
                  final post = data[index];
                  return Column(
                    children: [
                      Text(post.title),

                    ],
                  );
                },
            );
          },
          error:(err,stack) => Text('$err'),
          loading: () => Center(child: CircularProgressIndicator()),
      ),

    );
  }
}