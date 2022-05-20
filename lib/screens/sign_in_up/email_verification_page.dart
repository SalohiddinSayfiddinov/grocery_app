import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zakaz/core/constants/fonts.dart';
import 'package:zakaz/core/constants/padding.dart';
import 'package:zakaz/service/firebase_user.dart';
import 'package:zakaz/service/firestore_service.dart';
import 'package:zakaz/widgets/general_widgets/app_bar.dart';

class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({Key? key}) : super(key: key);

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  User? _user;
  Timer? _timer;

  @override
  void initState() {
    _user = AuthUser.authUser.currentUser;
    _user!.sendEmailVerification();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(title: "Email Verification"),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(Constants.kPadding),
        child: Column(
          children: [
            Text(
              "Verify Your Entrance",
              style: MyFonts.kTitles,
            ),
            Text(
              "An Email Has Been Sent to ${_user!.email}",
              style: MyFonts.kInfoTexts,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    _user = AuthUser.authUser.currentUser;
    await _user!.reload();
    if (_user!.emailVerified) {
      AddDataToFirestore.addDataToFirestore(
          "users", AuthUser.authUser.currentUser!.email!);
      _timer!.cancel();
      Navigator.pushNamed(context, "/");
    }
  }

  // addDataToFirestore() async {
  //   await Firestore.firestore
  //       .collection('users')
  //       .doc(AuthUser.authUser.currentUser!.email)
  //       .set(AddData.mapim);
  // }
}
