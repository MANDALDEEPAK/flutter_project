

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_proj/features/cloudinary/domain/cloudinary_response.dart' show CloudinaryResponse;
import 'package:image_picker/image_picker.dart';

import '../../cloudinary/data/cloudinary_repository.dart';
import '../../shared/instances.dart';

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
      CloudinaryResponse? response;
      if(image != null && imageId != null){
          response = await CloudinaryRepository.updateImageOrFile(File(image.path), imageId);
        }

      await FirebaseInstances.userDb.doc(userId).update({
        'email': email,
        'username': username,
        'phone': phone,
        'role': role,
        if(response != null) 'image': response.secure_url ,
      });
    }on FirebaseException catch (err){
      throw '${err.message}';
    }
  }


 static Future<void> removeUser({

    required String userId
  }) async {
    try{
      await FirebaseInstances.userDb.doc(userId).delete();
    }on FirebaseException catch (err){
      throw '${err.message}';
    }
  }

}