import 'package:flutter/material.dart';
import 'package:zakaz/models/grocery_model.dart';
import 'package:zakaz/screens/chat/chat_page.dart';
import 'package:zakaz/screens/home/cart_page.dart';
import 'package:zakaz/screens/home/category_page.dart';
import 'package:zakaz/screens/home/info_page.dart';
import 'package:zakaz/screens/home/main_page.dart';
import 'package:zakaz/screens/home/order_page.dart';
import 'package:zakaz/screens/profile/profile_page.dart';
import 'package:zakaz/screens/sign_in_up/email_page.dart';
import 'package:zakaz/screens/sign_in_up/email_verification_page.dart';
import 'package:zakaz/screens/sign_in_up/sign_in_page.dart';
import 'package:zakaz/screens/sign_in_up/sign_up_page.dart';

class RouteGenerator {
  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MainPage(),
        );
      case '/signInPage':
        return MaterialPageRoute(
          builder: (context) => SignInPage(),
        );
      case '/signUpPage':
        return MaterialPageRoute(
          builder: (context) => SignUpPage(),
        );
      case '/emailPage':
        return MaterialPageRoute(
          builder: (context) => EmailPage(password: args.toString()),
        );
      case '/emailVerificationPage':
        return MaterialPageRoute(
          builder: (context) => const EmailVerificationPage(),
        );
      case '/chatPage':
        return MaterialPageRoute(
          builder: (context) => const ChatPage(),
        );
      case '/infoPage':
        return MaterialPageRoute(
          builder: (context) => InfoPage(
            data: args as MyBuilder,
          ),
        );
      case '/cartPage':
        return MaterialPageRoute(
          builder: (context) => const CartPage(),
        );
      case '/orderPage':
        return MaterialPageRoute(
          builder: (context) => const OrderPage(),
        );
      case '/categoryPage':
        return MaterialPageRoute(
          builder: (context) => CategoryPage(
            data: (args as GroceryModel),
          ),
        );
      case '/profilePage':
        return MaterialPageRoute(
          builder: (context) => ProfilePage(),
        );
    }
  }
}
