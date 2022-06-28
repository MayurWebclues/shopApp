import 'package:cluesapps/models/product_model.dart';
import 'package:cluesapps/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/p_cart.dart';

class ProductItem extends StatelessWidget {
  /*final String id;
  final String title;
  final String imageUrl;

  const ProductItem(this.id, this.title, this.imageUrl);
*/
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProductModel>(context);
    var cardData = Provider.of<CartProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetails.routeName, arguments: {
            'id': data.id,
            'title': data.title,
            'imageUrl': data.imageUrl
          });
        },
        child: GridTile(
          child: Image.network(
            data.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            title: Text(
              data.title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black45,
            leading: IconButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                data.toggleFavorite();
              },
              icon: Icon(
                  data.isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
            trailing: IconButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                cardData.addCartItem(data.id, data.title, data.price);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: const Text(
                        'Item Added To Cart!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.redAccent),
                      ),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        onPressed: () {
                          cardData.removeSingleITem(data.id);
                        },
                        label: 'UNDO',
                      )),
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        ),
      ),
    );
  }
}
