import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_proj/features/cloudinary/data/cloudinary_repository.dart' show CloudinaryRepository;
import 'package:flutter_proj/features/cloudinary/domain/cloudinary_response.dart' show CloudinaryResponse;
import 'package:flutter_proj/features/shared/instances.dart' show FirebaseInstances;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'auth_repository.g.dart';

class AuthRepository{

  Future<void> userLogin ({required String email, required String password}) async{
    try{
      await FirebaseInstances.fireAuth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(err){
      throw '${err.message}';
    }
  }


  Future<void> userSignUp ({
    required String username, required String email,
    required String password, required XFile image,required int phone
  }) async{
    try{
      final credential = await FirebaseInstances.fireAuth.createUserWithEmailAndPassword(email: email, password: password);

      CloudinaryResponse response = await CloudinaryRepository.uploadImageOrFile(File(image.path));
      await FirebaseInstances.userDb.doc(credential.user!.uid).set({
       'username': username,
       'email': email,
        'phone': phone,
        'image': response.secure_url,
        'public_id': response.public_id,
        'role': 'user'
     });
    }on FirebaseAuthException catch(err){
      throw '${err.message}';
    }catch(err){
      print(err);
      throw '$err';
    }
  }

  static Future<void> userSignOut () async{
    try{
      await FirebaseInstances.fireAuth.signOut();
    }on FirebaseAuthException catch(err){
      throw '${err.message}';
    }
  }
  
}


@riverpod
AuthRepository  authRepo(Ref ref) {
  return AuthRepository();
}