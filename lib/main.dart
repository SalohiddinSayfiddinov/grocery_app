import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zakaz/models/cart_model.dart';
import 'package:zakaz/provider/data_controller_provider.dart';
import 'package:zakaz/provider/page_provider.dart';
import 'package:zakaz/provider/show_password_provider.dart';
import 'package:zakaz/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>('cart');
  await Hive.openBox<CartModel>('favourites');
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ShowPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DataControllerProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _forRouter = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salohiddin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _forRouter.onGenerateRoute,
      initialRoute: "/",
    );
  }
}
