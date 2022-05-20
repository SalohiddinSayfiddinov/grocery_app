import 'package:hive/hive.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? price;
  @HiveField(2)
  String? weight;
  @HiveField(3)
  String? image;
  @HiveField(4)
  String? description;

  CartModel({this.description, this.image, this.name, this.price, this.weight});

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
        description: json['description'],
        image: json['image'],
        name: json['name'],
        price: json['price'],
        weight: json['weight'],
      );
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'image': image,
      'name': name,
      'price': price,
      'weight': weight,
    };
  }
}
