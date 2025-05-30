import 'package:flutter_proj/features/authentication/data/auth_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_provider.g.dart';



@riverpod
class SignUpController extends _$SignUpController {
  @override
  FutureOr<void> build()  {
  }


  Future<void> userSignUp (Map<String,dynamic>data) async{
    state = const AsyncLoading();
    state  = await AsyncValue.guard(() => ref.read(authRepoProvider).userRegister(data));
  }
}
