// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  genre: json['genre'] as String,
  author: json['author'] as String,
  publisher: json['publisher'] as String,
  price: (json['price'] as num).toInt(),
  image: json['image'] as String,
  file: json['file'] as String,
);

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'genre': instance.genre,
      'author': instance.author,
      'publisher': instance.publisher,
      'price': instance.price,
      'image': instance.image,
      'file': instance.file,
    };
