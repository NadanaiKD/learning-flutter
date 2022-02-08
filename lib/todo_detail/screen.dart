import 'package:flutter/material.dart';
import 'package:learn_flutter/todo/model.dart';

class TodoDetailScreen extends StatelessWidget {
  static const routeName = "/todo-detail";
  const TodoDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todo = ModalRoute.of(context)!.settings.arguments as TodoModel;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Title : ${todo.title.toString()}"),
          Text("Finished : ${todo.finished}"),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          )
        ]),
      ),
    );
  }
}
