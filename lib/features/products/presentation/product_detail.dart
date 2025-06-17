import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/core/api.dart';
import 'package:flutter_proj/core/app_theme/app_sizes.dart';
import 'package:flutter_proj/features/carts/presentation/controllers/cart_provider.dart';
import 'package:flutter_proj/features/shared/user_state_provider.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'controllers/product_controller.dart';


class ProductDetail extends ConsumerWidget {
  final String id;
  const ProductDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context, ref) {
    final productState = ref.watch(getProductProvider(productId: id));
    final user = ref.watch(userStateProviderProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: productState.when(
          data: (data) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch ,
              children: [

                Expanded(
                  child: Column(
                    children: [
                      CachedNetworkImage(imageUrl: '$base${data.image}'),
                      AppSizes.gapH20,
                      Text(data.title),
                      Text(data.price.toString()),
                    ],
                  ),
                ),


                ElevatedButton(onPressed: user.role == 'Admin' ? null : (){
                  ref.read(cartControllerProvider.notifier).addToCart(data);
                  context.pushNamed(AppRoute.cart.name);
                }, child: Text('Add To Cart'))
              ],
            ),
          ),
          error: (err, st) => Text(err.toString()),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
