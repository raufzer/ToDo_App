import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      backgroundColor: const Color.fromARGB(255, 52, 79, 161),
      content: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // get user input
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 3, 25, 86)),
                      borderRadius: BorderRadius.circular(50.0)),
                  hintText: 'Add a new task',
                  hintStyle: const TextStyle(color: Color.fromARGB(255, 3, 25, 86)),
                ),
              ),
              // buttons cancel + save
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // save button
                  MyButton(text: "Save", onPressed: onSave),

                  const SizedBox(width: 8),
                  // cancel button
                  MyButton(text: "Cancel", onPressed: onCancel)
                ],
              )
            ],
          )),
    );
  }
}
