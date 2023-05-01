import 'package:e_commerce_app/pages/cart.dart';
import 'package:e_commerce_app/pages/detail.dart';
import 'package:e_commerce_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const HomePage(),
      initialRoute: 'home',
      routes: {
        ('home'): (context) => const HomePage(),
        ('DetailPage'): (context) => const DetailPage(),
        ('Cart'): (context) => const CartPage(),
      },
    );
  }
}
