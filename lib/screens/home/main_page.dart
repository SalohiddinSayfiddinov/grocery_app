import 'package:flutter/material.dart';
import 'package:zakaz/provider/page_provider.dart';
import 'package:zakaz/screens/home/cart_page.dart';
import 'package:zakaz/screens/home/favourites_page.dart';
import 'package:zakaz/screens/home/homepage.dart';
import 'package:provider/provider.dart';
import 'package:zakaz/screens/profile/profile_page.dart';
import 'package:zakaz/size_config/size_config.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage.homePageim(),
    CartPage.cartPageim(),
    FavouritesPage.favouritesPageim(),
    ProfilePage.profilePageim(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: pages[context.watch<PageProvider>().index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ((value) {
          context.read<PageProvider>().changeIndex(value);
        }),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
