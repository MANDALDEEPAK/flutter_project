import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/core/api.dart';
import 'package:flutter_proj/core/app_theme/app_sizes.dart';
import 'package:flutter_proj/features/carts/presentation/controllers/cart_provider.dart';
import 'package:flutter_proj/features/orders/presentation/controllers/order_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(orderControllerProvider, (prev, next){
      next.maybeWhen(
          data: (data){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Order Placed Successfully'),
            ));
          },
          error: (err, st) =>
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(err.toString()),
              )),
          orElse: () => null
      );
    });

    final carts = ref.watch(cartControllerProvider);
    final totalAmount = ref.watch(cartControllerProvider.notifier).totalAmount;
    final orderState = ref.watch(orderControllerProvider);


    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: carts.isEmpty ? Center(child: Text('Cart is empty'),) : ListView.separated(
                  separatorBuilder: (context, index){
                    return Divider();
                  },
                  itemCount: carts.length,
                    itemBuilder: (context, index){
                    final cart = carts[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: CachedNetworkImage(imageUrl: '$base/${cart.image}', height: 100, width: double.infinity, fit: BoxFit.cover,)),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(cart.title),
                                  Text('Rs, ${cart.price}'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OutlinedButton(onPressed: (){
                                        ref.read(cartControllerProvider.notifier).singleRemove(cart);
                                      }, child : Icon(CupertinoIcons.minus)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text('${cart.qty}'),
                                      ),
                                      OutlinedButton(onPressed: (){
                                        ref.read(cartControllerProvider.notifier).singleAdd(cart);
                                      }, child : Icon(Icons.add)),

                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )

                      ],
                    );
                    }
                )),
            if(carts.isNotEmpty)   Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Text('Total Amount: '),
               Text(totalAmount.toString())
             ],
           ),
           AppSizes.gapH16,
           if(carts.isNotEmpty) ElevatedButton(onPressed: (){
             ref.read(orderControllerProvider.notifier).addOrder(totalAmount: totalAmount, carts: carts);
           }, child: orderState.isLoading ? Center(child: CircularProgressIndicator()) : Text('Place an Order')),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}