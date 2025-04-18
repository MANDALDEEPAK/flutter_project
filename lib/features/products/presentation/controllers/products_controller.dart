import 'package:flutter_proj/features/products/data/product_repository.dart';
import 'package:flutter_proj/features/products/presentation/controllers/products_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/product.dart';
part 'products_controller.g.dart';


@riverpod
Future<List<Product>> getProducts(Ref ref) async {
  return ProductRepository().getProducts();
}
