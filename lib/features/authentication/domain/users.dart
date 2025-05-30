import 'package:freezed_annotation/freezed_annotation.dart';
part 'users.g.dart';

part 'users.freezed.dart';

@freezed
class Users with _$Users {
  const factory Users({
    required String token,
    required String role,
    required String username,
    required String email
}) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
