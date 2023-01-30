import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(title),
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
    );
  }
}
