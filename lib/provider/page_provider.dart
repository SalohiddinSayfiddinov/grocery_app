import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  int index = 0;

  changeIndex(value) {
    if (value == 0) {
      index = 0;
    } else if (value == 1) {
      index = 1;
    } else if (value == 2) {
      index = 2;
    } else if (value == 3) {
      index = 3;
    }
    notifyListeners();
  }
}
