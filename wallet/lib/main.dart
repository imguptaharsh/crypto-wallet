import 'package:flutter/material.dart';
import 'package:wallet/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Cypto Wallet',
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
