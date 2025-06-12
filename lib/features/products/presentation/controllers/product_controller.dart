import 'package:flutter_proj/features/products/data/product_repository.dart';
import 'package:flutter_proj/features/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';

int productIndex = 0;
@riverpod
Future<List<Product>> getProducts (Ref ref) async {

  return ref.watch(productRepoProvider).getProducts();
}

@riverpod
Future<Product> getProduct (Ref ref, {required String productId}) async {
  ref.keepAlive();
  return ref.watch(productRepoProvider).getProduct(productId: productId);
}



@riverpod
class ProductController extends _$ProductController {
  @override
  FutureOr<void> build() {}

  Future<void> addProduct (Map<String, dynamic> data, XFile image  ) async{
    state = const AsyncLoading();

    state  = await AsyncValue.guard(() =>ref.read(productRepoProvider).addProduct(data: data, image: image,));

  }
  Future<void> updateProduct ({required Map<String, dynamic> data, XFile? image, required String productId}  ) async{
    state = const AsyncLoading();

    state  = await AsyncValue.guard(() =>ref.read(productRepoProvider).updateProduct(data: data, image: image, productId: productId));

  }

  Future<void> removeProduct ({required String productId, required int index}  ) async{
    productIndex = index;
    state = const AsyncLoading();
    state  = await AsyncValue.guard(() =>ref.read(productRepoProvider).removeProduct(productId: productId));

  }
}