import 'package:dio/dio.dart';
import 'package:flutter_proj/core/contants/apis.dart';
import 'package:flutter_proj/features/shared/client_provider.dart';
import 'package:flutter_proj/features/todos/domain/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'todo_repository.g.dart';


class TodosRepository{

  final Dio client;
  TodosRepository(this.client);



  Future<List<Todo>> getTodos () async{
    try{
      final response  = await client.get(todosApi);
      return (response.data as List).map((todo) => Todo.fromJson(todo)).toList();
    }catch (err){
      throw 'something went wrong';
    }
  }

  Future<Todo> addTodo ({required Map<String,dynamic>todoData }) async{
    try{
      final response = await client.post(todosApi,data: todoData);
      return Todo.fromJson(response.data);

    }catch (err){
      throw 'something went wrong';
    }
  }

  Future<void> updateTodos ({required String id, required Map<String,dynamic>todoData}) async{
    try{
       await client.patch('$todosApi/$id',data: todoData);

    }catch (err){
      throw 'something went wrong';
    }
  }


  Future<void> removeTodos ({required String id}) async{
    try{
      await client.delete('$todosApi/$id');
    }catch (err){
      throw 'something went wrong';
    }
  }
}

@riverpod
TodosRepository todosRepository(Ref ref) {
  return TodosRepository(ref.watch(clientProvider)) ;
}