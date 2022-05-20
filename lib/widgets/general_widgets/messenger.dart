import 'package:flutter/material.dart';

class MyMessenger {
  static showMessenger(BuildContext context, String text, Color color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
