import 'package:flutter_test/flutter_test.dart';
import 'package:learn_flutter/todo/controller.dart';
import 'package:learn_flutter/todo/model.dart';

void main() {
  group("TodoList", () {
    test(
        "Finished value should be True. when user checked a checkbox and current is False",
        () {
      var controller = TodoController();
      controller.todoList = List.from([
        TodoModel(title: "mock 1", finished: false),
        TodoModel(title: "mock 2")
      ]);
      controller.checkTask(0);
      var actual = controller.todoList[0].finished;
      expect(actual, true);
    });

    test("TodoList value should be has 1 item, when user created Todo", () {
      var controller = TodoController();
      controller.addTask("mock 1");

      expect(controller.todoList.length, 1);
      expect(controller.todoList.first.title, "mock 1");
    });
  });
}
