import 'package:flutter_proj/features/carts/domain/cart.dart';
import 'package:flutter_proj/features/products/domain/product.dart';
import 'package:flutter_proj/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';


@riverpod
class CartController extends _$CartController {
  @override
  List<Cart> build() {
    final box = ref.watch(cartBoxProvider);
    return box;
  }

  void addToCart(Product product){
    final isExist = state.firstWhere((cart) => cart.id == product.id, orElse:() => Cart(title: 'no-item', image: '', price: 0, qty: 0, id: ''));
    if(isExist.title == 'no-item'){
      final newCart = Cart(
          title: product.title,
          image: product.image,
          price: product.price,
          qty: 1,
          id: product.id
      );
      state.add(newCart);
      Hive.box<Cart>('carts').add(newCart);
    }else{
      isExist.qty = isExist.qty + 1;
      isExist.save();

    }

  }

  void singleAdd(Cart cart){
    cart.qty = cart.qty + 1;
    cart.save();

    state = [
      for(final oldCart in state) oldCart.id == cart.id ? cart: oldCart
    ];

  }

  void singleRemove(Cart cart){
    if(cart.qty == 1) return;
    cart.qty = cart.qty - 1;
    cart.save();

    state = [
      for(final oldCart in state) oldCart.id == cart.id ? cart: oldCart
    ];
  }


  void clearCart(){
    state = [];
    Hive.box<Cart>('carts').clear();
    ref.read(cartBoxProvider).clear();

  }

  int get totalAmount{
    return state.fold(0, (previousValue, element) => previousValue + element.price * element.qty);
  }


}
