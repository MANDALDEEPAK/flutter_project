import 'package:flutter/material.dart';
import 'package:flutter_proj/core/api.dart';
import 'package:flutter_proj/features/products/presentation/controllers/product_controller.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class AdminDashboard extends ConsumerWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.listen(productControllerProvider,(prev, next){
      next.maybeWhen(
        data: (data){
          ref.invalidate(getProductsProvider);
        } ,
        orElse: (){},
      );
    });

    final productState = ref.watch(getProductsProvider);
    final productController = ref.watch(productControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(onPressed: (){
            context.pushNamed(AppRoute.productAdd.name);
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: productState.when(
          data: (data){
            return ListView.separated(
                itemBuilder: (context,index){
                  final product = data[index];
                  return ListTile(
                    onTap: (){
                     // context.pushNamed(AppRoute.bookDetail.name, extra: book);
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('$base${product.image}'),
                    ),
                    title: Text(product.title),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                          context.pushNamed(AppRoute.productEdit.name, extra: product);
                          }, icon: const Icon(Icons.edit)),
                          IconButton(onPressed: (){
                            showDialog(context: context, builder:(context) {
                              return AlertDialog(
                                title: const Text('Delete Book'),
                                content: const Text('Are you sure you want to delete this book?'),
                                actions: [
                                  TextButton(onPressed: () {
                                    context.pop();
                                  }, child: const Text('Cancel')),
                                  TextButton(
                                      onPressed: (){
                                        context.pop();
                                        ref.read(productControllerProvider.notifier).removeProduct(index: index, productId: product.id);

                                      }, child: const Text('Delete'))
                                ]
                              );
                            });
                          }, icon: productController.isLoading && productIndex == index ? const CircularProgressIndicator() : const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context,index) => Divider(),
                itemCount: data.length
            );
          },
          error: (err, st) => Text(err.toString()),
          loading: () => const Center(child: CircularProgressIndicator(),)
      )


    );
  }
}