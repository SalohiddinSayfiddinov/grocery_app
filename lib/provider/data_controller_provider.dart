import 'package:flutter/material.dart';
import 'package:zakaz/service/user_service.dart';

class DataControllerProvider extends ChangeNotifier {
  removeDataFromCart(int index) {
    UserService.cart.deleteAt(index);
    notifyListeners();
  }

  removeDataFromFavourites(int index) {
    UserService.favourites.deleteAt(index);
    notifyListeners();
  }
}
