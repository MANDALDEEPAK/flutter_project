

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_proj/features/shared/instance.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repository.g.dart';



class AuthRepository{


  Future<void> userLogin({required String email, required String password}) async{
    try{
      await FirebaseInstances.fireAuth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch (err){
      throw '${err.message}';
    }
  }


  Future<void> userSignUp ({
    required String username, required String email,
    required String password, required XFile image,required int phone
  }) async{
    try{
      final credential = await FirebaseInstances.fireAuth.createUserWithEmailAndPassword(email: email, password: password);

      CloudinaryResponse response = await CloudinaryInstances.cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path, resourceType: CloudinaryResourceType.Image),
      );
      await FirebaseInstances.userDb.doc(credential.user!.uid).set({
        'username': username,
        'email': email,
        'phone': phone,
        'image': response.secureUrl,
        'role': 'user'
      });
    }on FirebaseAuthException catch(err){
      print(err.message);
      print(err);
      throw '${err.message}';
    }on CloudinaryException catch(err){
      print(err.message);
      print(err);
      throw '${err.message}';
    }
  }


 static Future<void> userSignOut() async{
    try{
      await FirebaseInstances.fireAuth.signOut();
    }on FirebaseAuthException catch (err){
      throw '${err.message}';
    }
  }
}


@riverpod
AuthRepository authRepository (Ref ref) {
  return AuthRepository() ;
}