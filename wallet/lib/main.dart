import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:wallet/HomePage.dart';

import 'package:wallet/screens/HomePage.dart';
import 'package:wallet/provider/data.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CryptoInfoProvider(), child: const MyApp()));
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
