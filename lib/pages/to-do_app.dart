import 'package:flutter/material.dart';
import 'package:flutprac/pages/components/dialog_box.dart';
import 'package:flutprac/pages/components/tasktile.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final TextEditingController _controller = TextEditingController();
  List<List<dynamic>> todolist = [
    ["make money", false],
    ["learn flutter", false]
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      todolist[index][1] = value ?? false;
    });
  }

  void saveToList() {
    setState(() {
      Navigator.pop(context);
      todolist.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void cancelList() {
    Navigator.pop(context);
  }

  // Create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onsave: saveToList,
          oncancel: cancelList,
        );
      },
    );
  }

  void deletetask(int index) {
    setState(() {
      todolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, // Changed scaffold background color
      appBar: AppBar(
        elevation: 2,
        title: Text("TO-DO LIST"),
        centerTitle: true,

        backgroundColor: Colors.teal, // Changed appbar background color
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) => Tasktile(
          onChanged: (value) {
            checkboxChanged(value, index);
          },
          task: todolist[index][0].toString(),
          taskcompleted: todolist[index][1] as bool,
          deletefunction: (context) => deletetask(index),
        ),
      ),
    );
  }
}
