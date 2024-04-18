import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool completed;
  Function(bool?)? onChanged;
  Function(BuildContext) onDelete;

  TodoTile({
    super.key,
    required this.completed,
    required this.taskName,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 16, right: 16, left: 16),
    child:Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: onDelete,
            icon: Icons.delete, 
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
      child:  Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blue[300], borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                value: completed,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(taskName,
                style: TextStyle(
                  decoration: completed ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
