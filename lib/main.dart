import 'package:flutter/material.dart';
import 'package:mad2_lab_ex_01/screens/view_products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewProductsScreen(),
    );
  }
}
