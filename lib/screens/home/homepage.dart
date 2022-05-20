import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zakaz/core/components/model_generator.dart';
import 'package:zakaz/core/components/text_form_field_comp.dart';
import 'package:zakaz/core/constants/fonts.dart';
import 'package:zakaz/core/constants/padding.dart';
import 'package:zakaz/models/grocery_model.dart';
import 'package:zakaz/screens/home/search_page.dart';
import 'package:zakaz/service/firebase_firestore.dart';
import 'package:zakaz/service/firestore_service.dart';
import 'package:zakaz/service/user_service.dart';
import 'package:zakaz/size_config/size_config.dart';
import 'package:zakaz/widgets/home_page_widgets/grid_view_builder.dart';
import 'package:zakaz/widgets/home_page_widgets/list_view_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: homePageim(),
    );
  }

  static StreamBuilder<QuerySnapshot<Object?>> homePageim() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.firestore.collection("goods").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: Text("Loading..."),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        } else {
          List<GroceryModel> categories = generateModel(snapshot);
          return Container(
            margin: EdgeInsets.only(
              top: getHeight(40.0),
              left: Constants.kPadding,
              right: Constants.kPadding,
            ),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      InkWell(
                        child: Container(
                          color: Colors.grey,
                          height: getHeight(50.0),
                          width: getWidth(200.0),
                        ),
                        onTap: () {
                          showSearch(context: context, delegate: SearchPage([]));
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getHeight(20.0),
                          bottom: getHeight(15.0),
                        ),
                        child: Text(
                          "Choose Category",
                          style: MyFonts.kTitles,
                        ),
                      ),
                      SizedBox(
                        height: getHeight(140.0),
                        child: MyListView.myListView(categories),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getHeight(20.0),
                          bottom: getHeight(15.0),
                        ),
                        child: Text(
                          "Best Selling",
                          style: MyFonts.kTitles,
                        ),
                      ),
                    ],
                  ),
                ),
                MySliverGrid.mySliverGrid(categories),
              ],
            ),
          );
        }
      },
    );
  }
}
