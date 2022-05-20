import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zakaz/models/grocery_model.dart';
import 'package:zakaz/size_config/size_config.dart';

class MyListView {
  static ListView myListView(List<GroceryModel> data) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: getHeight(10), vertical: getHeight(6)),
            width: getWidth(123.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                getHeight(20.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: CachedNetworkImage(
                    imageUrl: data[index].image!,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(data[index].categoryName!),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              "/categoryPage",
              arguments: data[index],
            );
          },
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
    );
  }
}
