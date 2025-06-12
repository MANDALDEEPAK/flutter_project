import 'package:dio/dio.dart';
import 'package:flutter_proj/core/api.dart';
import 'package:flutter_proj/features/shared/user_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_provider.g.dart';

@riverpod
Dio client(Ref ref) {
  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );
}


@riverpod
Dio authClient(Ref ref) {
  final token = ref.watch(userStateProviderProvider).token;
  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {'Authorization': token},
    ),
  );
}
