import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/components/todo_dialog_box.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/data/database.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  final _todo_app_box = Hive.box('todo_app_box');

  TodoDatabase db = TodoDatabase();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (_todo_app_box.get('todos') == null) {
      db.createInitalData();
    } else {
      db.loadData();
    }
  }
  void change(bool? checked,int index) {
    setState(() {
      db.todos[index]['completed'] = checked;
      db.updateDatabase();
    });
  }

  void createNewTask(){
    if(_controller.text.isNotEmpty) {
      setState(() {
        db.todos.add({'label': _controller.text, 'completed': false});
        _controller.clear();
        db.updateDatabase();
      });
      Navigator.of(context).pop();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Title required')));
    }
  }

  void handleDeleteTask(index){
    setState(() {
      db.todos.removeAt(index);
      db.updateDatabase();
    });
  }
  void handleAddTask(){
    showDialog(
        context: context,
        builder: (context) {
          return TodoDialogBox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSuccess: createNewTask,
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: handleAddTask,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),
      backgroundColor: Colors.blue[200],
      body: ListView.builder(
          itemCount: db.todos.length,
          itemBuilder: (context, index) {
        return TodoTile(
            completed: db.todos[index]['completed'],
            taskName: db.todos[index]['label'],
            onChanged: (checked) => change(checked,index),
            onDelete: (context) => handleDeleteTask(index),
        );
      }),
    );
  }
}

