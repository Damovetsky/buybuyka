import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String productId;
  final String title;
  final String imageUrl;

  UserProductItem(this.productId, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName,
                    arguments: productId);
              },
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (cxt) => AlertDialog(
                    title: Text('Are you sure?'),
                    content:
                        Text('Do you want to permanently remove this item?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(cxt).pop(),
                        child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<Products>(context, listen: false)
                              .removeProduct(productId);
                          Navigator.of(cxt).pop();
                        },
                        child: Text('Yes'),
                      )
                    ],
                  ),
                );
              },
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
