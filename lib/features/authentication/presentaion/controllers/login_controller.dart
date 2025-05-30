
import 'package:flutter_proj/features/authentication/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';



@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build()  {}


  Future<void> userLogin (Map<String,dynamic>data) async{
    state = const AsyncLoading();
    state  = await AsyncValue.guard(() => ref.read(authRepoProvider).userLogin(data));
  }
}
