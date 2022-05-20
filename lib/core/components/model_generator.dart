import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zakaz/models/grocery_model.dart';

generateModel(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
  List<GroceryModel> blabla = [];

  for (int index = 0;
      index < snapshot.data!.docs[0]['categories'].length;
      index++) {
    List<MyBuilder> myBuilderHelper = [];

    for (int j = 0;
        j < snapshot.data!.docs[0]["categories"][index]["builder"].length;
        j++) {
      myBuilderHelper.add(
        MyBuilder(
          description: snapshot.data!.docs[0]["categories"][index]["builder"][j]
              ["description"],
          image: snapshot.data!.docs[0]["categories"][index]["builder"][j]
              ["image"],
          name: snapshot.data!.docs[0]["categories"][index]["builder"][j]
              ["name"],
          price: snapshot.data!.docs[0]["categories"][index]["builder"][j]
              ["price"],
          weight: snapshot.data!.docs[0]["categories"][index]["builder"][j]
              ["weight"],
        ),
      );
    }

    blabla.add(
      GroceryModel(
          image: snapshot.data!.docs[0]["categories"][index]["image"],
          categoryName: snapshot.data!.docs[0]["categories"][index]
              ["category_name"],
          builder: myBuilderHelper),
    );

   
  }
  return blabla;
}
