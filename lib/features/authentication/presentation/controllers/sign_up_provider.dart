import 'dart:async';

import 'package:flutter_proj/features/authentication/data/auth_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sign_up_provider.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  Object? _key;
  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose((){
      _key = null;
    });
  }

  Future<void> userSignUp({
    required String username,
    required String email,
    required String password,
    required XFile image,
    required int phone
}) async {
    state = const AsyncLoading();
    final key = _key;
   final newState = await AsyncValue.guard(() =>
        ref.read(authRepositoryProvider).userSignUp(
            username: username,
            email: email,
            password: password,
            image: image,
            phone: phone
        ));
    if(key == _key){
      state = newState;
    }
  }
}
