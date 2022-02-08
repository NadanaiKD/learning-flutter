import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter/todo/controller.dart';
import 'package:learn_flutter/todo/screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/todo-list";
  const HomeScreen({Key? key})
      : super(key: key); //สามารถลบได้ ถ้ายังไม่ได้ใช้ key

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();
  TodoController controller = TodoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat("d MMMM yyyy").format(DateTime.now()),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: showModalAddTodo,
                  icon: Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          TodoList(
            controller: controller,
          ),
        ],
      ),
    ));
  }

  void showModalAddTodo() async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(children: [
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  child: Text("SAVE"),
                  onPressed: () {
                    setState(() {
                      controller.addTask(titleController.text);
                    });
                    // titleController.text = "";
                    titleController.clear();
                    Navigator.pop(context, "reload");
                    // Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: titleController,
                    ),
                  ],
                ),
              )
            ]),
          );
        }).then((value) {
      if (value != null && value == "reload") return "RELOAD";
    });
  }
}
