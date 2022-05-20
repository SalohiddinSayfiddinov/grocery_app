import 'package:flutter/material.dart';
import 'package:zakaz/widgets/general_widgets/app_bar.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(title: "Order"),
    );
  }
}
