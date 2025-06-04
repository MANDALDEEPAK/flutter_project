// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      title: json['title'] as String,
      id: json['_id'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? 0,
      image: json['image'] as String? ?? '',
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      category: json['category'] as String? ?? '',
      brand: json['brand'] as String? ?? '',
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      '_id': instance.id,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
      'rating': instance.rating,
      'category': instance.category,
      'brand': instance.brand,
    };
