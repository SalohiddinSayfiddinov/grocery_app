import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zakaz/core/constants/fonts.dart';
import 'package:zakaz/core/constants/padding.dart';
import 'package:zakaz/models/grocery_model.dart';
import 'package:zakaz/size_config/size_config.dart';
import 'package:zakaz/widgets/general_widgets/app_bar.dart';
import 'package:zakaz/widgets/general_widgets/buttons.dart';

class CategoryPage extends StatelessWidget {
  GroceryModel? data;
  CategoryPage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: MyAppBar.appBar(title: data!.categoryName.toString()),
      body: Container(
        padding: EdgeInsets.all(Constants.kPadding),
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: getHeight(242),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0),
          itemBuilder: (context, index) {
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
                        imageUrl: data!.builder![index].image.toString(),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/infoPage",
                          arguments: data,
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
                                data!.builder![index].name.toString(),
                                style: MyFonts.kTitles,
                              ),
                              Text(
                                data!.categoryName.toString(),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${data!.builder![index].price}/kg",
                              style: MyFonts.kTitles,
                            ),
                            MyButtons.addButton(data!.builder![index], context),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: data!.builder!.length,
        ),
      ),
    );
  }
}
