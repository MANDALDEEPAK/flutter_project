
import 'package:flutter/material.dart';
import 'package:flutter_proj/features/products/presentation/controllers/products_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(getProductsProvider);
    // print(productState);
    return Scaffold(
      appBar: AppBar(

      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(getProductsProvider.future),
        child: Center(
          child: productState.when(
              data: (data){
                return ListView.separated(
                    itemBuilder: (context,index){
                      return ListTile(
                        title: Text(data[index].title),
                        subtitle: Text(data[index].description),
                      );
                    },
                    separatorBuilder: (context,index) => Divider(),
                    itemCount: data.length,
                );
              },
              error: (err, stack) => Column(
                children: [
                  Text('$err'),
                  ElevatedButton(onPressed: (){
                    ref.invalidate(getProductsProvider);
                  }, child: Text('Refresh'))
                ],
              ),
              loading: () => Center(child: CircularProgressIndicator(),)
          ),
        ),
      ),

    );
  }
}