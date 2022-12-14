// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:jumia/provider/Orders.dart';
import 'package:jumia/provider/products_provider.dart';
import 'package:jumia/screens/cart_screen.dart';
import 'package:jumia/screens/edit_product_screen.dart';
import 'package:jumia/screens/orders_screen.dart';
import 'package:jumia/screens/product_detail_screen.dart';
import 'package:jumia/screens/products_overview_screen.dart';
import 'package:jumia/screens/user_product_screen.dart';
import 'package:provider/provider.dart';

import 'provider/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),

        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),

        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductsOverviewScreen(),
        routes: {
          CartScreen.routeName:(context) => CartScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          OrdersScreen.routeName:(context) => OrdersScreen(),
          UserProductScreen.routeName:(context) => UserProductScreen(),
          EditProductScreen.routeName:(context) => EditProductScreen()      
          },
        
      ),
    );
  }
}
