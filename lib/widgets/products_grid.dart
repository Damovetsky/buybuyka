import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart ';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (cxt, index) => ProductItem(
        products[index].id,
        products[index].title,
        products[index].imageUrl,
        products[index].price,
      ),
    );
  }
}
