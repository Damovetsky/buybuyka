import 'package:flutter/material.dart';

import './screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final theme = ThemeData(primarySwatch: Colors.purple);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          secondary: Colors.deepOrange,
        ),
      ),
      home: ProductsOverviewScreen(),
    );
  }
}
