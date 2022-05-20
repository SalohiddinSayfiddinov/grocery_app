import 'package:flutter/widgets.dart';

class ShowPasswordProvider extends ChangeNotifier {
  bool obscure = true;
  void show() {
    obscure = !obscure;
    notifyListeners();
  }
}