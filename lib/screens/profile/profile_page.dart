import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zakaz/core/constants/fonts.dart';
import 'package:zakaz/service/firebase_firestore.dart';
import 'package:zakaz/service/firebase_user.dart';
import 'package:zakaz/size_config/size_config.dart';
import 'package:zakaz/widgets/general_widgets/app_bar.dart';
import 'package:zakaz/widgets/profile_widgets/profile_list_view.dart';
import 'package:zakaz/widgets/profile_widgets/profile_column.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: profilePageim(),
    );
  }

  static StreamBuilder<QuerySnapshot<Object?>> profilePageim() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.firestore.collection("users").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Text("Loading..."),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        } else {
          dynamic data = snapshot.data;
          for (int i = 0; i < snapshot.data!.docs.length; i += 1) {
            // ignore: unrelated_type_equality_checks
            if (snapshot.data!.docs[i].id ==
                AuthUser.authUser.currentUser!.email) {
              data = snapshot.data!.docs[i];
            }
          }
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Profile",
                    style: MyFonts.kTitles,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
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
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: MyProfileListView.myListView(),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
