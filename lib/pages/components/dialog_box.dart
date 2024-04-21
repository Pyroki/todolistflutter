import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback oncancel;
  final VoidCallback onsave;

  DialogBox({
    Key? key,
    required this.controller,
    required this.oncancel,
    required this.onsave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade400,
      content: Container(
        height: 150,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your new task",
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: oncancel,
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: onsave,
                  child: Text("Add Task"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
