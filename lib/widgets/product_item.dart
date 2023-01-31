import 'package:buybuyka/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailsScreen.routeName, arguments: product.id);
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          header: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 150),
              padding:
                  const EdgeInsets.only(bottom: 5, top: 3, left: 8, right: 8),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10)),
                color: Colors.black54,
              ),
              child: Text(
                product.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                overflow: TextOverflow.fade,
                maxLines: 1,
              ),
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              '\$${product.price}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            leading: IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                //...
              },
            ),
          ),
        ),
      ),
    );
  }
}
