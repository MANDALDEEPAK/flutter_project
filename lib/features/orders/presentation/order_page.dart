import 'package:flutter/material.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'controllers/order_controller.dart';


class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.watch(getOrdersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: orderState.when(
          data: (data){
            return ListView.separated(
              reverse: true,
              separatorBuilder: (context, index) => const Divider(),
              itemCount: data.length,
              itemBuilder: (context, index){
                final order = data[index];
                return ListTile(
                  onTap: (){
                    context.pushNamed(AppRoute.orderDetail.name, extra: order.id);
                  },
                  title: Text(order.id),
                  subtitle: Text('Date:- ${order.createdAt.substring(0,10)}'),
                  trailing:  Text('Total:- Rs. ${order.totalAmount}'),
                );
              }
            );
          },
          error: (err, st) => Text(err.toString()),
          loading: () => const Center(child: CircularProgressIndicator(),)
      ) ,
    );
  }
}