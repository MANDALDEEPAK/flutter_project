import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseInstances{
  static final fireAuth = FirebaseAuth.instance;
  static final userDb = FirebaseFirestore.instance.collection('user');
  static final bookDb = FirebaseFirestore.instance.collection('books');

}

class CloudinaryInstances{
  static final cloudinary = CloudinaryPublic('dfa7zhtr3', 'ml_default', cache: false);
}