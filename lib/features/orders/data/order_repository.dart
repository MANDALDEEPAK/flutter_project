import 'package:dio/dio.dart';
import 'package:flutter_proj/core/api.dart';
import 'package:flutter_proj/core/exception/api_exception.dart';
import 'package:flutter_proj/features/carts/domain/cart.dart';
import 'package:flutter_proj/features/orders/domain/order.dart';
import 'package:flutter_proj/features/shared/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_repository.g.dart';


class OrderRepository{
  final Dio client;
  
  OrderRepository({required this.client});


  Future<List<Order>> getOrders() async{
    try{
     final response =   await client.get('$orders/users');
     return (response.data as List).map((e) => Order.fromJson(e)).toList();
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }


  Future<Order> getOrderDetail(String orderId) async{
    try{
      final response =   await client.get('$orders/$orderId');
      return  Order.fromJson(response.data);
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }

  Future<void> addOrder({required int totalAmount, required List<Cart> carts}) async{
    try{
      await client.post(orders, data: {
        'totalAmount': totalAmount,
        'orderItems': carts.map((e) => e.toJson()).toList()
      });
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }
}


@riverpod
 OrderRepository orderRepo(Ref ref) {
  return OrderRepository(client: ref.watch(authClientProvider));
}