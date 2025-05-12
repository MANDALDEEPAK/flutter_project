import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String name,
    required String email,
    required String image,
    required int phone,
    required String uid,
  }) = _UserData;


}