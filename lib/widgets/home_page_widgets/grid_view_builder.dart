import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zakaz/core/constants/fonts.dart';
import 'package:zakaz/models/grocery_model.dart';
import 'package:zakaz/size_config/size_config.dart';
import 'package:zakaz/widgets/general_widgets/buttons.dart';

class MySliverGrid {
  static SliverGrid mySliverGrid(List<GroceryModel> data) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: getHeight(242),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            margin: EdgeInsets.all(getHeight(1.0)),
            padding: EdgeInsets.all(
              getHeight(10.0),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                getHeight(20.0),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: InkWell(
                    child: CachedNetworkImage(
                      imageUrl: data[index].builder![0].image!,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/infoPage",
                        arguments: data[index].builder![0],
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].builder![0].name!,
                              style: MyFonts.kTitles,
                            ),
                            Text(
                              data[index].categoryName!,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${data[index].builder![0].price}/kg",
                            style: MyFonts.kTitles,
                          ),
                          MyButtons.addButton(data[index].builder![0], context),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        childCount: data.length,
      ),
    );
  }
}
