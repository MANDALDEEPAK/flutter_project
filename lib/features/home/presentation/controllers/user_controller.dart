
import 'package:flutter_proj/features/home/domain/user_data.dart' show UserData;
import 'package:flutter_proj/features/shared/instances.dart' show FirebaseInstances;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';



@riverpod
Stream<UserData> userProfileStream (Ref ref) {
  return FirebaseInstances.userDb.doc(FirebaseInstances.fireAuth.currentUser!.uid).snapshots().map((event) {
    final map = event.data() as Map<String, dynamic>;
    return map == null ? UserData(
        username: '', email: '',
        public_id: '',
        image: '', phone:0, uid: '', role: '')
        : UserData(
        username: map['username'],
        email: map['email'],
        public_id: map['public_id'],
        role: map['role'],
        image: map['image'],
        phone: map['phone'], uid: event.id);
  });
}
