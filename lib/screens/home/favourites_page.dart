import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zakaz/core/constants/fonts.dart';
import 'package:zakaz/models/cart_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zakaz/service/user_service.dart';
import 'package:zakaz/size_config/size_config.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: favouritesPageim(),
    );
  }

  static ValueListenableBuilder<Box<CartModel>> favouritesPageim() {
    return ValueListenableBuilder<Box<CartModel>>(
      valueListenable: Hive.box<CartModel>("favourites").listenable(),
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
                    child: Text("Favourites", style: MyFonts.kTitles),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: data.isNotEmpty
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisExtent: getHeight(242),
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0),
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: EdgeInsets.all(getHeight(10.0)),
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
                                flex: 6,
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: getWidth(180.0),
                                      height: getHeight(200.0),
                                      child: CachedNetworkImage(
                                        imageUrl: data[index].image.toString(),
                                      ),
                                    ),
                                    Positioned(
                                      right: getHeight(-12),
                                      top: getHeight(-12),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          UserService.favourites
                                              .deleteAt(index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  width: getWidth(170),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data[index].name.toString(),
                                        style: MyFonts.kTitles,
                                      ),
                                      Text(
                                        "1 Kilogram",
                                        style: MyFonts.kInfoTexts,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      itemCount: data.length,
                    )
                  : const Center(
                      child: Text("You Do not Have Favourites"),
                    ),
            ),
          ],
        );
      },
    );
  }
}
