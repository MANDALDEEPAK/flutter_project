
import 'package:dio/dio.dart';
import 'package:flutter_proj/core/api.dart';
import 'package:flutter_proj/core/exception/api_exception.dart';
import 'package:flutter_proj/features/authentication/domain/users.dart';
import 'package:flutter_proj/features/shared/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'auth_repository.g.dart';

class AuthRepository{
final Dio dio;

AuthRepository(this.dio);
  Future<Users> userLogin (Map<String,dynamic>map) async{
    try{
      final response = await dio.post(login,data: map);
      return Users.fromJson(response.data);
    }on DioException catch(err){
      throw ApiException(err).errorMessage;
    }
  }



Future<void> userRegister (Map<String,dynamic>map) async{
  try{
    await dio.post(register,data: map);
  }on DioException catch(err){
    throw ApiException(err).errorMessage;
  }
}
}


@riverpod
AuthRepository  authRepo(Ref ref) {
  return AuthRepository(ref.watch(clientProvider));
}