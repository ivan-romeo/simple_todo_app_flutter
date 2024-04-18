import 'package:flutter/material.dart';
import 'package:todo_app/components/button.dart';

class TodoDialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSuccess;
  final VoidCallback onCancel;
  const TodoDialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'New task',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: 'Cancel', onPressed: onCancel),
                const SizedBox(width: 8,),
                Button(text: 'Confirm', onPressed: onSuccess),
              ],
            )
          ],
        ),
      ),
    );
  }
}
