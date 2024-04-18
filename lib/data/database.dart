import 'package:hive_flutter/adapters.dart';

class TodoDatabase{
  List todos = [];
  final _todo_app_box = Hive.box('todo_app_box');

  createInitalData(){
    todos = [
      {"label": 'Make Tutorial', "completed": false},
      {"label": 'second', "completed": true},
    ];
  }

  void loadData () {
    todos = _todo_app_box.get('todos');
  }

  void updateDatabase() {
    _todo_app_box.put('todos',todos);
  }

}