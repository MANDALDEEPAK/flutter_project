import 'package:dio/dio.dart';
import 'package:flutter_proj/core/api.dart';
import 'package:flutter_proj/core/exception/api_exception.dart';
import 'package:flutter_proj/features/products/domain/product.dart';
import 'package:flutter_proj/features/shared/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';



class ProductRepository {


  final Dio client;
  ProductRepository(this.client);

  Future<List<Product>> getProducts () async{
    try{
      final response = await client.get(products);
      return (response.data as List).map((e) => Product.fromJson(e)).toList();
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }

  Future<Product> getProduct ({required String productId}) async{
    try{
      final response = await client.get('$products/$productId');
      return Product.fromJson(response.data);
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }

  Future<void> addProduct ({required Map<String, dynamic> data, required XFile image}) async{
    final formData = FormData.fromMap({
      ...data,
      'image': await MultipartFile.fromFile(image.path, filename: image.name),
    });
    try{
       await client.post(products, data: formData);
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }

  Future<void> updateProduct ({required Map<String, dynamic> data,  XFile? image, required String productId}) async{
    final formData = FormData.fromMap({
      ...data,
      if(image != null) 'image': await MultipartFile.fromFile(image.path, filename: image.name),
    });
    try{
      await client.patch('$products/$productId', data: formData);
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }

  Future<void> removeProduct ({ required String productId}) async{

    try{

      await client.delete('$products/$productId');
    }on DioException catch(err){

      throw ApiException(err).errorMessage;
    }
  }

}


@riverpod
ProductRepository productRepo (Ref ref) {
  return ProductRepository(ref.watch(authClientProvider));
}