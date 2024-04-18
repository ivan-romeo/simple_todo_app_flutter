import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/pages/todo_page.dart';

void main() async {

  await Hive.initFlutter();
  var box = await Hive.openBox('todo_app_box');
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget{
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      title: 'Todo App',
      home: TodoPage(),
    );
  }

}



