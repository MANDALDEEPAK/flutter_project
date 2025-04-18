// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$$ProductsImpl _$$$ProductsImplFromJson(Map<String, dynamic> json) =>
    _$$ProductsImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$$ProductsImplToJson(_$$ProductsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
