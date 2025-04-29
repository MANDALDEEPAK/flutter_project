import 'package:dio/dio.dart';
import 'package:flutter_proj/core/contants/apis.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'client_provider.g.dart';


@riverpod
 Dio client (Ref ref) {
  return Dio(BaseOptions(
   baseUrl: baseUrl,
  )) ;
}
