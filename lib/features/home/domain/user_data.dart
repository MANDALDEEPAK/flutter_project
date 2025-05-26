import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';


@freezed
class UserData with _$UserData {
  const factory UserData({
    required String username,
    required String email,
    required String image,
    required int phone,
    required String uid,
    required  String role,
    required String public_id
  }) = _UserData;


}
