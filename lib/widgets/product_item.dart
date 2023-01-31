import 'package:buybuyka/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final double price;

  ProductItem(this.id, this.title, this.imageUrl, this.price);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailsScreen.routeName, arguments: id);
        },
        child: GridTile(
          child: Image.network(
            imageUrl,
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
                title,
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
              '\$$price',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            leading: IconButton(
              icon: Icon(Icons.favorite),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                //...
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
