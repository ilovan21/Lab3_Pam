import 'package:flutter/material.dart';
import 'screens/wine_shop_home.dart';

void main() {
  runApp(WineShopApp());
}

class WineShopApp extends StatelessWidget {
  const WineShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wine Shop',
      theme: ThemeData(primarySwatch: Colors.red),
      home: WineShopHome(),
    );
  }
}
