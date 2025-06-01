import 'package:flutter_proj/features/products/data/product_repository.dart';
import 'package:flutter_proj/features/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';


@riverpod
Future<List<Product>> getProducts (Ref ref) async {
  return ref.watch(productRepoProvider).getProducts();
}
