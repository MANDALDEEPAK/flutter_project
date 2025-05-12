import 'package:flutter_proj/features/shared/instance.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/user_data.dart';

part 'user_controller.g.dart';



@riverpod
Stream<UserData> userStream(Ref ref) {
  return FirebaseInstances.userDb.doc(FirebaseInstances.fireAuth.currentUser!.uid).snapshots().map((event){
    final map = event.data() as Map<String,dynamic>;
    return UserData(
        name: map['name'],
        email: map['email'],
        image:map['image'],
        phone:map['phone'],
        uid: event.id);
  });
}
