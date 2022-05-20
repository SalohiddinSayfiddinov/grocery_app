// import 'dart:io';

// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:zakaz/models/user_model.dart';

// class DatabaseHelper {
//   DatabaseHelper._privateCounstuctor();
//   static final DatabaseHelper instance = DatabaseHelper._privateCounstuctor();

//   static Database? _database;
//   Future<Database> get database async => _database ??= await _initDatabase();

//   Future<Database> _initDatabase() async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.path, 'cart.db');
//     return await openDatabase(path, version: 1, onCreate: _onCreate);
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//     CREATE TABLE cart(
//       name  String,
//       price String,
//       weight String,
//       image String,
//       description String
//     )
//     ''');
//   }

//   Future<List<CartModel>> getCart() async {
//     Database db = await instance.database;
//     var cart = await db.query('cart', orderBy: 'name');
//     List<CartModel> userList =
//         cart.isNotEmpty ? cart.map((e) => CartModel.fromMap(e)).toList() : [];
//     return userList;
//   }

//   Future<int> add(CartModel cart) async {
//     Database db = await instance.database;
//     print("Processing");
//     return await db.insert('cart', cart.toMap());
//   }
// }
