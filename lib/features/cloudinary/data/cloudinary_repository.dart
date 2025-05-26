

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_proj/features/cloudinary/domain/cloudinary_response.dart' show CloudinaryResponse;



class CloudinaryRepository {
 static final Dio dio = Dio();
static const baseApi = 'https://cloudinary-api-0pch.onrender.com/api';

  static Future<CloudinaryResponse> uploadImageOrFile(File file)  async{
     try{
       final formData = FormData.fromMap({
         'file': await MultipartFile.fromFile(file.path),
       });
       final response = await dio.post(
           '$baseApi/files',
         data: formData
       );
       return CloudinaryResponse.fromJson(response.data);
     } catch (err){

       throw '$err';
     }
  }

 static Future<CloudinaryResponse> updateImageOrFile(File file, String publicId)  async{
   try{
     final formData = FormData.fromMap({
       'file': await MultipartFile.fromFile(file.path),
     });
     final response = await dio.patch(
         '$baseApi/files/$publicId',
         data: formData
     );
     return CloudinaryResponse.fromJson(response.data);
   } catch (err){

     throw '$err';
   }
 }

 static Future<void> removeImageOrFile(String publicId)  async{
   try{
      await dio.delete('$baseApi/files/$publicId');
   } catch (err){
     throw '$err';
   }
 }



}