// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// list of todo tasks
class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _contreller = TextEditingController();

  // check box
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.ToDoList[index][1] = !db.ToDoList[index][1];
    });
    db.updateDatabase();
  }

// save new task
  void saveNewTask() {
    setState(() {
      db.ToDoList.add([_contreller.text, false]);
      _contreller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

// create a new task
  void creatNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _contreller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
    db.updateDatabase();
  }

// delete task
  void deleteTask(int index) {
    setState(() {
      db.ToDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 52, 79, 161),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 52, 79, 161),
        centerTitle: true,
        title: Text('ToDo'),
        elevation: 0, // remove shadow under app bar
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        backgroundColor: Color.fromARGB(255, 234, 5, 255),
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 234, 5, 255).withOpacity(0.35),
                spreadRadius: 8,
                blurRadius: 8,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            color: Color(0xffE1E8EB),
            size: 24,
            // shadows: [
            //   Shadow(
            //     color: Color(0xffE1E8EB),
            //     offset: Offset(0.2, 0.5),
            //     blurRadius: 5.0,
            //   )
            // ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: db.ToDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.ToDoList[index][0],
            taskCompleted: db.ToDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deletefunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
