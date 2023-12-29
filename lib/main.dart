import 'package:ecommerceapp/models/shop.dart';
import 'package:ecommerceapp/utils/light_mode.dart';
import 'package:ecommerceapp/view/cart_screen.dart';
import 'package:ecommerceapp/view/intro_screen.dart';
import 'package:ecommerceapp/view/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Shop())
      ],
      child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: IntroScreen(),
      routes: {
        '/intro_screen':(context) => const IntroScreen(),
        '/shop_screen':(context) => const ShopScreen(),
        '/cart_screen':(context) => const CartScreen(),
      },
    ),
    );
  }
}
