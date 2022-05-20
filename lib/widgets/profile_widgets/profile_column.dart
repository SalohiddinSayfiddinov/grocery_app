import 'package:flutter/material.dart';
import 'package:zakaz/core/constants/fonts.dart';
import 'package:zakaz/size_config/size_config.dart';

class MyProfileColumn {
  static myColumn(data) {
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: getHeight(85.5),
        ),
        Text(
          data['name'],
          style: MyFonts.kTitles,
        ),
      ],
    );
  }
}
