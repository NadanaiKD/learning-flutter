import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_flutter/todo/model.dart';

class TodoService {
  final http.Client _httpClient = http.Client();

  Future<List<TodoModel>> getTodoList() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users/1/todos");
    var response = await _httpClient.get(url);
    if (response.statusCode == 200) {
      var todoList = jsonDecode(response.body);
      // print(todoList);

      return List.from(todoList.map((todo) => TodoModel.fromJson(todo)));
      // TodoModel.fromJson(todoList);
    }
    return [];
  }
}
