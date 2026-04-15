import 'package:flutter/material.dart';

class MainError extends StatelessWidget {
  String title;
  VoidCallback onTap;

  MainError({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Something went wrong"),
        ElevatedButton(onPressed: onTap, child: Text("Try Again")),
      ],
    );
  }
}
