import 'package:flutter_proj/features/home/domain/user_data.dart' show UserData;
import 'package:flutter_proj/features/shared/instances.dart' show FirebaseInstances;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_list_controller.g.dart';


@riverpod
Stream<List<UserData>> usersStream (Ref ref) {

 return FirebaseInstances.userDb.where('role', isEqualTo: 'user').snapshots().map((docs) => docs.docs.map((e) {
    final map = e.data();
    return UserData(
        username: map['username'],
        email: map['email'],
        role: map['role'],
        public_id: map['public_id'] ,
        image: map['image'], phone: map['phone'], uid: e.id);
  }).toList());


}
