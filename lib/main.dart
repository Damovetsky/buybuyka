import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_details_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final theme = ThemeData(
    primarySwatch: Colors.purple,
    fontFamily: 'Lato',
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            secondary: Colors.orangeAccent,
          ),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailsScreen.routeName: (cxt) => ProductDetailsScreen(),
          CartScreen.routeName: (cxt) => CartScreen(),
          OrdersScreen.routeName: (cxt) => OrdersScreen(),
          UserProductsScreen.routeName: (cxt) => UserProductsScreen(),
          EditProductScreen.routeName: (cxt) => EditProductScreen(),
        },
      ),
    );
  }
}
