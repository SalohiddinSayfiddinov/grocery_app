import 'package:hive/hive.dart';
import 'package:zakaz/models/cart_model.dart';

class UserService {
  static Box cart = Hive.box<CartModel>('cart');
  static Box favourites = Hive.box<CartModel>('favourites');
}