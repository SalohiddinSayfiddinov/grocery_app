import 'package:flutter/material.dart';

class MyAppBar {
  static appBar({required String title}) => AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
}
