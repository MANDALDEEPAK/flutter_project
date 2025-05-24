
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../domain/cloudinary_response.dart';


class CloudinaryRepository {
 static final Dio dio = Dio();


 static Future<CloudinaryResponse> uploadImage(File file)  async{
  try{
   final formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(file.path),
   });
   final response = await dio.post(
       'https://cloudinary-api-0pch.onrender.com/api/files',
       data: formData
   );
   return CloudinaryResponse.fromJson(response.data);
  } catch (err){
   throw '$err';
  }
 }



}