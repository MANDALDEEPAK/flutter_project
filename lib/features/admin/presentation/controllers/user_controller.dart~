
import 'package:image_picker/image_picker.dart';
import 'package:magh/features/admin/data/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_controller.g.dart';


@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<void> build(){}



  Future<void> userUpdate({
    required String email,
    required String username,
    required int phone,
    required String role,
    required String userId,
    XFile? image,
    String? imageId,
  }) async {
    state = const AsyncLoading();
    state  = await AsyncValue.guard(() => UserRepository.userUpdate(
        email: email,
        username: username,
        phone: phone,
        role: role,
        userId: userId,
        image: image,
        imageId: imageId
    ));
  }
  Future<void> removeUser({

    required String userId
  }) async {
    state = const AsyncLoading();
    state  = await AsyncValue.guard(() => UserRepository.removeUser(userId: userId));
  }
}
