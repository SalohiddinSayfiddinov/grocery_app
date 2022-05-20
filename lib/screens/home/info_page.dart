import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zakaz/core/constants/fonts.dart';
import 'package:zakaz/core/constants/padding.dart';
import 'package:zakaz/models/cart_model.dart';
import 'package:zakaz/models/grocery_model.dart';
import 'package:zakaz/provider/favourite_provider.dart';
import 'package:zakaz/service/user_service.dart';
import 'package:zakaz/size_config/size_config.dart';
import 'package:zakaz/widgets/general_widgets/buttons.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatefulWidget {
  MyBuilder data;
  InfoPage({Key? key, required this.data}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: UserService.favourites.containsKey(widget.data.name)
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_outline),
            onPressed: () {
              if (UserService.favourites.containsKey(widget.data.name)) {
                UserService.favourites.delete(widget.data.name);
              } else {
                UserService.favourites.put(
                  widget.data.name,
                  CartModel(
                    description: widget.data.description,
                    image: widget.data.image,
                    name: widget.data.name,
                    price: widget.data.price,
                    weight: widget.data.weight,
                  ),
                );
              }
              setState(() {});
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: CachedNetworkImage(imageUrl: widget.data.image!),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.all(Constants.kPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.name!,
                    style: myTextStyle(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.data.weight!,
                        style: TextStyle(
                            fontSize: getHeight(25), color: Colors.grey),
                      ),
                      SizedBox(
                        child: Row(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHeight(10.0)),
                            child: Text(
                              '1',
                              style: myTextStyle(),
                            ),
                          ),
                          MyButtons.addButton(widget.data, context),
                        ]),
                      ),
                    ],
                  ),
                  Text(
                    "${widget.data.price}/kg",
                    style: myTextStyle(),
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Details", style: MyFonts.kTitles),
                        SizedBox(height: getHeight(10.0)),
                        Text(widget.data.description!,
                            style: MyFonts.kInfoTexts),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        child: const Text("Add to Cart"),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF2ECC71),
                          fixedSize: Size(getWidth(298.0), getHeight(52.0)),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              getHeight(100.0),
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.comment_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle myTextStyle() {
    return TextStyle(fontSize: getHeight(36), fontWeight: FontWeight.bold);
  }
}
