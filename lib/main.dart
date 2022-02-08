import 'package:flutter/material.dart';
import 'package:learn_flutter/home.dart';
import 'package:learn_flutter/todo_detail/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        TodoDetailScreen.routeName: (context) => TodoDetailScreen(),
      },
      // home: const HomeScreen(), //widgetหน้าแรกที่เราจะเจอ
    );
  }
}
