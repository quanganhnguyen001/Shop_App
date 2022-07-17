import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_project/module/cart/page/cart_page.dart';
import 'package:shop_app_project/module/detail/page/product_detail.dart';
import 'package:shop_app_project/providers/cart.dart';
import 'package:shop_app_project/providers/products_provider.dart';

import 'module/home/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.deepOrange),
        ),
        home: const HomePage(),
        routes: {
          ProductDetail.routeName:(context) => ProductDetail(),
          CartPage.routeName:(context) => CartPage(),
        },
      ),
    );
  }
}

