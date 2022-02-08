import 'package:flutter/material.dart';
import 'package:learn_flutter/todo/controller.dart';
import 'package:learn_flutter/todo/model.dart';
import 'package:learn_flutter/todo/service.dart';
import 'package:learn_flutter/todo_detail/screen.dart';

class TodoList extends StatefulWidget {
  final TodoController controller;
  TodoList({Key? key, required this.controller}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late Future<List<TodoModel>> futureTodos;
  @override
  void initState() {
    // TODO: implement initState
    // widget.controller.getTodoList();
    futureTodos = widget.controller.getTodoList();
    super.initState();
  }

  // getTodoList(){
  //   widget.controller.getTodoList().then((value) {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureTodos,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Expanded(
            child: ListView.builder(
                itemCount: widget.controller.todoList.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    secondary: IconButton(
                      icon: Icon(Icons.account_box_sharp),
                      onPressed: () {
                        Navigator.pushNamed(context, TodoDetailScreen.routeName,
                            arguments: widget.controller.todoList[index]);
                      },
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 26),
                    selectedTileColor: Colors.grey[200],
                    selected: widget.controller.todoList[index].finished,
                    title: Text(widget.controller.todoList[index].title),
                    subtitle: Text("SUBTITLE"),
                    value: widget.controller.todoList[index].finished,
                    onChanged: (bool? checked) {
                      setState(() {
                        widget.controller.checkTask(index);
                      });
                    },
                  );
                }),
          );
        });
  }
}
