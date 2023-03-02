import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/pages/Home_page.dart';

void main() async {
  // int the hive 
  await Hive.initFlutter();
  // open a box 
  // ignore: unused_local_variable
  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 52, 79, 161)) // make the default color for all widget 'color'
    );
  }
}