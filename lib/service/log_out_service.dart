import 'package:zakaz/service/firebase_user.dart';

Future signOut() async {
  try {
    AuthUser.authUser.signOut();
    return true;
  } catch (e) {
    print("ERROR: $e");
    return false;
  }
}
