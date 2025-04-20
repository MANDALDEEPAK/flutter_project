// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  ingredients:
      (json['ingredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  instructions:
      (json['instructions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  cuisine: json['cuisine'] as String? ?? 'not-available',
  image: json['image'] as String? ?? 'not-available',
);

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
      'cuisine': instance.cuisine,
      'image': instance.image,
    };
