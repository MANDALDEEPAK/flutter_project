// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoImpl _$$TodoImplFromJson(Map<String, dynamic> json) => _$TodoImpl(
  id: json['id'] as String,
  todo_task: json['todo_task'] as String,
  isCompleted: json['isCompleted'] as bool,
);

Map<String, dynamic> _$$TodoImplToJson(_$TodoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todo_task': instance.todo_task,
      'isCompleted': instance.isCompleted,
    };
