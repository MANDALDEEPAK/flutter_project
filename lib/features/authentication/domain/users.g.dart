// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersImpl _$$UsersImplFromJson(Map<String, dynamic> json) => _$UsersImpl(
  token: json['token'] as String,
  role: json['role'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$$UsersImplToJson(_$UsersImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'role': instance.role,
      'username': instance.username,
      'email': instance.email,
    };
