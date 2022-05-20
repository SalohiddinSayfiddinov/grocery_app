import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakaz/models/cart_model.dart';
import 'package:zakaz/models/grocery_model.dart';
import 'package:zakaz/provider/show_password_provider.dart';
import 'package:zakaz/service/user_service.dart';

import 'package:zakaz/size_config/size_config.dart';
import 'package:zakaz/widgets/general_widgets/messenger.dart';

class MyButtons {
  static elevatedButtonStyle(double height) => ElevatedButton.styleFrom(
        primary: const Color(0xFF2ECC71),
        fixedSize: Size(getWidth(374), height),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getHeight(100.0),
          ),
        ),
      );
  static suffixIcon(BuildContext context) => IconButton(
        splashRadius: 20,
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () {
          context.read<ShowPasswordProvider>().show();
        },
      );
  static addButton(MyBuilder data, BuildContext context) => InkWell(
        child: Container(
          width: getWidth(36.0),
          height: getHeight(36.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF2ECC71),
            borderRadius: BorderRadius.circular(
              getHeight(10.0),
            ),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        onTap: () {
          if (UserService.cart.containsKey(data.name)) {
            null;
          } else {
            UserService.cart.put(
              data.name,
              CartModel(
                description: data.description,
                image: data.image,
                name: data.name,
                price: data.price,
                weight: data.weight,
              ),
            );
            MyMessenger.showMessenger(context, "Added to Cart", Colors.green);
          }
        },
      );
}
