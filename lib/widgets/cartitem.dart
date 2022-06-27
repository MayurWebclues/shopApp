import 'package:cluesapps/providers/p_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartItems extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  CartItems(
      {required this.id,
      required this.productId,
      required this.title,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
            Provider.of<CartProvider>(context).removeItem(id);
      },
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).shadowColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Padding(
          padding: EdgeInsets.all(4),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                  child: Text(
                    '\S$price',
                    style: TextStyle(fontSize: 12),
                  ),
                  fit: BoxFit.fitWidth),
            ),
            title: Text(title),
            subtitle: Text('Total :\$${price * quantity}'),
            trailing: Text('Quantity:$quantity'),
          ),
        ),
      ),
    );
  }
}
