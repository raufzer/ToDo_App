import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50), // <-- Radius
      ),
      onPressed: onPressed,
      color: const Color.fromARGB(255, 3, 25, 86),
      child: Text(
        text,
        // ignore: prefer_const_constructors
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
