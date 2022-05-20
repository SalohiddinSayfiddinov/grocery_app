import 'package:zakaz/service/firebase_user.dart';

class SigninService {
  static Future signInWithEmail(String email, String password) async {
    try {
      await AuthUser.authUser.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print("ERROR: $e");
      return false;
    }
  }
}
