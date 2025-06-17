import 'dart:convert';
import 'package:flutter_proj/features/authentication/domain/user.dart';
import 'package:flutter_proj/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_state_provider.g.dart';


@riverpod
class UserStateProvider extends _$UserStateProvider {
  @override
  User build() {
    final user = ref.watch(hiveBoxProvider).get('user');
   return user == null ? User.empty() : User.fromJson(jsonDecode(user));
  }


  void setUser(User user) {
    Hive.box('box').put('user', jsonEncode(user));
    state = user;
  }

  void removeUser() {
    Hive.box('box').delete('user');
    state = User.empty();
  }



}
