import 'package:flutter/material.dart';

class MyProfileListView {
  static ListView myListView() {
    return ListView(
      children: [
        ListTile(
          leading: SizedBox(
            child: Image.asset('assets/images/edit_profile.png'),
          ),
          title: const Text("Edit Profile"),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          leading: SizedBox(
            child: Image.asset('assets/images/my_wishlist.png'),
          ),
          title: const Text("My Wishlist"),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          leading: SizedBox(
            child: Image.asset('assets/images/change_password.png'),
          ),
          title: const Text("Change Password"),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          leading: SizedBox(
            child: Image.asset('assets/images/logout.png'),
          ),
          title: const Text("Logout"),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
      ],
    );
  }
}
