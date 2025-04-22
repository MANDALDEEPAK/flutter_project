// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  views: (json['views'] as num).toInt(),
  userId: (json['userId'] as num).toDouble(),
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  reactions:
      (json['reactions'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  image: json['image'] as String? ?? 'not-available',
);

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'views': instance.views,
      'userId': instance.userId,
      'tags': instance.tags,
      'reactions': instance.reactions,
      'image': instance.image,
    };
