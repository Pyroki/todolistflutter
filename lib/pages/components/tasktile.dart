import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Tasktile extends StatelessWidget {
  final String task;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;

  Tasktile({
    Key? key,
    required this.onChanged,
    required this.task,
    required this.taskcompleted,
    required this.deletefunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deletefunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 219, 224, 225),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskcompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  task,
                  style: TextStyle(
                    decoration: taskcompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: Colors.blue, // Adjusted text color to blue
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
