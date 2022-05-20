
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zakaz/service/firebase_user.dart';

class SignUpService {
  static Future signUpWithEmailAndPAssword(
      String email, String password) async {
    try {
      UserCredential _credential =
          await AuthUser.authUser.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? _user = _credential.user;
      return true;
    } catch (e) {
      print("USER SIGN UP ERROR: $e");
      return false;
    }
  }
}
