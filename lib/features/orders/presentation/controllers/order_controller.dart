
import 'package:flutter_proj/features/carts/domain/cart.dart';
import 'package:flutter_proj/features/carts/presentation/controllers/cart_provider.dart';
import 'package:flutter_proj/features/orders/data/order_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'order_controller.g.dart';


@riverpod
class OrderController extends _$OrderController {
  @override
  FutureOr<void> build() {}

  Future<void> addOrder({required int totalAmount, required List<Cart> carts}) async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async{
      await ref.read(orderRepoProvider).addOrder(totalAmount: totalAmount, carts: carts);
      ref.read(cartControllerProvider.notifier).clearCart();
    });
  }
}
