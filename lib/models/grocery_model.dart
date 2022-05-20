
class GroceryModel {
  GroceryModel({
    this.categoryName,
    this.image,
    this.builder,
  });

  String? categoryName;
  String? image;
  List<MyBuilder>? builder;

  factory GroceryModel.fromJson(Map<String, dynamic> json) => GroceryModel(
        categoryName: json["category_name"],
        image: json["image"],
        builder:
            List<MyBuilder>.from(json["Mybuilder"].map((x) => MyBuilder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "image": image,
        "Mybuilder": List<dynamic>.from(builder!.map((x) => x.toJson())),
      };
}

class MyBuilder {
  MyBuilder({
    this.name,
    this.weight,
    this.image,
    this.price,
    this.description,
  });

  String? name;
  String? weight;
  String? image;
  String? price;
  String? description;

  factory MyBuilder.fromJson(Map<String, dynamic> json) => MyBuilder(
        name: json["name"],
        weight: json["weight"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "weight": weight,
        "image": image,
        "price": price,
        "description": description,
      };
}
