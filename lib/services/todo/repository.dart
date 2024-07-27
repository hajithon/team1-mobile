import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:hajithon_teami_flutter_app/network/api.dart';
import 'package:hajithon_teami_flutter_app/services/todo/model.dart';

class TodoRepository {
  final ApiProvider api;
  TodoRepository({ApiProvider? api}) : api = api ?? Get.find<ApiProvider>();

  Future<Todo> createTodo(String title) async {
    String url = "/todos/";

    Map<String, dynamic> data = {
      'title': title,
    };

    Response response = await api.dio.post(url, data: data);
    return Todo.fromJson(response.data);
  }

  Future<Todo> patchTodo(int todoId, {String? title, bool? done}) async {
    String url = "/todos/$todoId/";

    Map<String, dynamic> data = {};

    if (title != null) {
      data['title'] = title;
    }
    if (done != null) {
      data['status'] = done;
    }

    Response response = await api.dio.patch(url, data: data);
    return Todo.fromJson(response.data);
  }

  Future<List<Todo>> getTodos() async {
    String url = '/todos/';
    Response response = await api.dio.get(url);
    return (response.data as List).map((e) => Todo.fromJson(e)).toList();
  }

  Future<void> deleteTodo(int id) async {
    String url = "/todos/$id/";

    await api.dio.delete(url);
  }
}
