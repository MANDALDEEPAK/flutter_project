import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository {


 static Future<void> userUpdate({
    required String email,
    required String username,
    required int phone,
    required String role,
    required String userId,
   XFile? image,
   String? imageId,
  }) async {
    try{

    }on FirebaseException catch (err){
      throw '${err.message}';
    }
  }


 static Future<void> removeUser({
    required String userId
  }) async {
    try{

    }on FirebaseException catch (err){
      throw '${err.message}';
    }
  }

}