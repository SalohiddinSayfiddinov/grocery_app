import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zakaz/core/constants/fonts.dart';
import 'package:zakaz/models/cart_model.dart';
import 'package:zakaz/provider/data_controller_provider.dart';
import 'package:zakaz/service/firebase_user.dart';
import 'package:zakaz/size_config/size_config.dart';
import 'package:provider/provider.dart';
import 'package:zakaz/widgets/general_widgets/buttons.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: cartPageim());
  }

  static ValueListenableBuilder<Box<CartModel>> cartPageim() {
    return ValueListenableBuilder<Box<CartModel>>(
      valueListenable: Hive.box<CartModel>("cart").listenable(),
      builder: (context, box, index) {
        List<CartModel> data = box.values.toList();
        return Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: getHeight(30.0)),
                    child: Text("My Cart", style: MyFonts.kTitles),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: data.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          child: ListTile(
                            leading: SizedBox(
                              height: getHeight(100.0),
                              width: getHeight(100.0),
                              child: CachedNetworkImage(
                                imageUrl: data[index].image.toString(),
                              ),
                            ),
                            title: Text("${data[index].name}"),
                            subtitle: Text("${data[index].price} \$/kg"),
                            trailing: SizedBox(
                              width: getWidth(100.0),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: "kg",
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          onDismissed: (direction) {
                            context
                                .read<DataControllerProvider>()
                                .removeDataFromCart(index);
                          },
                          background: Container(color: Colors.red),
                        );
                      },
                      itemCount: data.length,
                    )
                  : const Center(
                      child: Text("Your Cart is Empty"),
                    ),
            ),
            data.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(
                      bottom: getHeight(30.0),
                    ),
                    child: ElevatedButton(
                      child: const Text("Order Now"),
                      style: MyButtons.elevatedButtonStyle(getHeight(52.0)),
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                            AuthUser.authUser.currentUser == null
                                ? "/signInPage"
                                : "/orderPage");
                      },
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
