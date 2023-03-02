import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  // ignore: non_constant_identifier_names
  List ToDoList = [];
  // reference our box
  final _myBox = Hive.box('myBox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    ToDoList = [
      ["Do Exercise", false],
      ["Check Emails", false],
    ];
  }

  // load the data from database
  void loadData() {
    ToDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDatabase() {
    _myBox.put("TODOLIST", ToDoList);
  }
}
