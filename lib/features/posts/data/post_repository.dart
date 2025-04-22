import 'package:dio/dio.dart';
import 'package:flutter_proj/features/posts/domain/post.dart';
import 'package:flutter_proj/features/recipes/domain/recipe.dart';


class PostRepository{

  final dio = Dio();
  Future<List<Post>> getPosts()  async{
    try{
      final response = await dio.get('https://dummyjson.com/posts');
      return (response.data['posts'] as List).map((post){
            return Post.fromJson(post);
      }).toList();

    }catch(err){
      throw 'Something went wrong';

    }
  }
}