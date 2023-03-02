import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  Function(BuildContext)? deletefunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deletefunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children:[
          SlidableAction(onPressed: deletefunction,
          icon: Icons.delete,
          backgroundColor: const Color.fromARGB(255, 234, 5, 255),
          borderRadius: BorderRadius.circular(30.0),)
        ]),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 3, 25, 86),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                shape: const CircleBorder(),
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: const Color.fromARGB(255, 52, 79, 161),
              ),
              // check box
      
              // task name
              Text(
                taskName,
                style: TextStyle(
                    color: Colors.white,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
