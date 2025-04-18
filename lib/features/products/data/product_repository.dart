import 'package:dio/dio.dart';
import 'package:flutter_proj/features/products/domain/product.dart';

class ProductRepository{

  final dio = Dio();
  Future<List<Product>> getProducts()  async{
    try{
      final response = await dio.get('https://dummyjson.com/products');
      return (response.data['products'] as List).map((products){
            return Product.fromJson(products);
      }).toList();

    }catch(err){
      throw 'Something went wrong';

    }
  }
}