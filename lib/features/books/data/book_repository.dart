import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_proj/features/books/domain/book.dart' show Book;
import 'package:flutter_proj/features/cloudinary/data/cloudinary_repository.dart' show CloudinaryRepository;
import 'package:flutter_proj/features/cloudinary/domain/cloudinary_response.dart' show CloudinaryResponse;
import 'package:flutter_proj/features/shared/instances.dart' show FirebaseInstances;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'book_repository.g.dart';


class BookRepository {

  Stream<List<Book>> getBooks(){
    return
      FirebaseInstances.bookDb.snapshots().map((event) => event.docs.map((e) {
        final map = e.data();
        return Book.fromJson({...map, 'id': e.id});
      }).toList());
  }


  Future<void> addBook ({
    required File file,
    required XFile image,
    required String title,
    required String genre,
    required int price,
    required String publisher,
    required String author,
    required String description
  }) async{
    try{
      final response1 = await CloudinaryRepository.uploadImageOrFile(file);
      final response2 = await CloudinaryRepository.uploadImageOrFile(File(image.path));

         await FirebaseInstances.bookDb.add({
           'title': title,
           'genre': genre,
           'price': price,
           'publisher': publisher,
           'author': author,
           'imageUrl': response2.secure_url,
           'fileUrl': response1.secure_url,
           'imageId': response2.public_id,
           'fileId': response1.public_id,
           'description': description,
           'userId': FirebaseInstances.fireAuth.currentUser!.uid
         });

    } on FirebaseException catch(err){
      throw '${err.message}';

    }catch(err){
      throw '$err';
    }


  }



  Future<void> updateBook ({
     File? file,
     XFile? image,
     String? imageUrl,
     String? fileUrl,
     String? imageId,
     String? fileId,
    required String title,
    required String genre,
    required int price,
    required String publisher,
    required String author,
    required String description,
    required String bookId,
  }) async{
    try{

      CloudinaryResponse? response1;
      CloudinaryResponse? response2;
      if(image != null && imageId != null){
          response1 = await CloudinaryRepository.updateImageOrFile(File(image.path), imageId);
      }
      if(file != null && fileId != null){
        response2 = await CloudinaryRepository.updateImageOrFile(file, fileId);
      }

      await FirebaseInstances.bookDb.doc(bookId).update({
        'title': title,
        'genre': genre,
        'price': price,
        'publisher': publisher,
        'author': author,
       if(response1 != null) 'imageUrl': response1.secure_url ,
         if(response2 != null) 'fileUrl': response2.secure_url,
         if(response1 != null) 'imageId': response1.public_id,
         if(response2 != null) 'fileId': response2.public_id,
      });

    } on FirebaseException catch(err){
      throw '${err.message}';

    }catch(err){
      print(err);
       throw '$err';
    }


  }



  Future<void> removeBook ({
   required String bookId,
   required String imageId,
    required String fileId,
  }) async{
    try{
       await CloudinaryRepository.removeImageOrFile(imageId);
       await CloudinaryRepository.removeImageOrFile(fileId);
      await FirebaseInstances.bookDb.doc(bookId).delete();
    } on FirebaseException catch(err){
      throw '${err.message}';

    }catch(err){
      throw '$err';
    }


  }


}

@riverpod
BookRepository bookRepo(Ref ref) {
  return BookRepository();
}