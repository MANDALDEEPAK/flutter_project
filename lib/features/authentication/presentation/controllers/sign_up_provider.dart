import 'dart:async';

import 'package:flutter_proj/features/authentication/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sign_up_provider.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<void> build() {}

  Future<void> userSignUp({required String username,required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() =>
        ref.read(authRepositoryProvider).userSignUp(username: username, email: email, password: password));
  }
}
