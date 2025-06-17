import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/core/api.dart';
import 'package:flutter_proj/core/app_theme/app_sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/order_controller.dart';

class OrderDetail extends ConsumerWidget {
  final String orderId;
  const OrderDetail({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, ref) {
    final orderState = ref.watch(getOrderProvider(orderId: orderId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail- $orderId', style: TextStyle(fontSize: 14) ,),
      ),
      body:  orderState.when(
          data: (data) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSizes.gapH10,
                Text(data.id),
                Text(data.createdAt),
                AppSizes.gapH20,
                Column(
                  children: data.orderItems.map((orderItem) => Column(
                    children: [
                      Row(
                        children: [
                          CachedNetworkImage(imageUrl: '$base${orderItem.image}', height: 100, width: 100, fit: BoxFit.cover,),
                          AppSizes.gapW20,
                          Column(
                            children: [
                              Text(orderItem.title),
                              Text('Rs. ${orderItem.price} X ${orderItem.qty}'),
                            ],
                          ),

                        ],
                      ),
                      AppSizes.gapH20,

                    ],
                  )).toList(),
                )
              ],
            ),
          ),
          error: (err, st) {
           // print(st);
            return Text(err.toString());
          },
          loading: () => const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
