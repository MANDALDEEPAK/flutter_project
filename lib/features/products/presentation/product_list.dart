import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/core/api.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'controllers/product_controller.dart';


class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(getProductsProvider);
    return productState.when(
        data: (data){
          return GridView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {

              final product = data[index];
            return InkWell(
              onTap: (){
                context.pushNamed(AppRoute.productDetail.name, extra: product.id);
              },
              child: GridTile(
                  footer: Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                    ),
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Text(product.title, style: const TextStyle(color: Colors.white),),
                        Text('Rs. ${product.price}', style: const TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                ),
                  child: CachedNetworkImage(imageUrl: '$base${product.image}', fit: BoxFit.cover,),
              ),
            );
            },
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10
          ),
          );
        },
        error: (err, st) {
          print(st);
          return Text(err.toString());
        },
          loading:
         () => const Center(child: CircularProgressIndicator(),)
    );
  }
}