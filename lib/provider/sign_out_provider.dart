import 'package:flutter/material.dart';
import 'package:zakaz/service/firebase_user.dart';
import 'package:zakaz/service/log_out_service.dart';

class SignOutProvider extends ChangeNotifier {
  Future signOut() async {
    try {
      AuthUser.authUser.signOut();
    } catch (e) {
      print("ERROR: $e");
    }
    notifyListeners();
  }
}
