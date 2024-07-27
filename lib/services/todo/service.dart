import 'package:get/get.dart';
import 'package:hajithon_teami_flutter_app/services/todo/model.dart';
import 'package:hajithon_teami_flutter_app/services/todo/repository.dart';

class TodoService extends GetxController {
  final TodoRepository repository;

  final Rx<List<Todo>> _todos = Rx([]);
  List<Todo> get todos => _todos.value;

  TodoService({TodoRepository? repository}) : repository = repository ?? TodoRepository();

  Future<Todo> createTodo(String title) async {
    Todo newTodo = await repository.createTodo(title);

    List<Todo> newTodos = List.from(todos);
    newTodos.add(newTodo);
    newTodos.sort((a, b) => a.todoDate.difference(b.todoDate).inSeconds);
    _todos.value = newTodos;

    return newTodo;
  }

  Future<void> editTodo(int todoId, {String? title, bool? done}) async {
    Todo updatedTodo = await repository.patchTodo(todoId, title: title, done: done);

    List<Todo> newTodos = List.from(todos);
    newTodos.removeWhere((todo) => todo.id == todoId);
    newTodos.add(updatedTodo);
    newTodos.sort((a, b) => a.todoDate.difference(b.todoDate).inSeconds);
    _todos.value = newTodos;
  }

  Future<void> fetchTodos() async {
    List<Todo> newTodos = await repository.getTodos();
    newTodos.sort((a, b) => a.todoDate.difference(b.todoDate).inSeconds);
    _todos.value = newTodos;
  }

  Future<void> deleteTodo(int id) async {
    await repository.deleteTodo(id);

    List<Todo> newTodos = List.from(todos);
    newTodos.removeWhere((todo) => todo.id == id);
    _todos.value = newTodos;
  }
}
