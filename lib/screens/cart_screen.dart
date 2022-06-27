import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/p_cart.dart';
import '../widgets/cartitem.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = "/cartscreen";

  @override
  Widget build(BuildContext context) {
    var cardProvide = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart'), centerTitle: true),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Spacer(),
                  Chip(
                    label: Text('\$${cardProvide.totalAmount}'),
                    backgroundColor: Theme.of(context).primaryColorDark,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'ORDER NOW',
                        style: Theme.of(context).textTheme.titleSmall,
                      ))
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, index) => CartItems(
              id: cardProvide.Items.values.toList()[index]!.id,
              productId: cardProvide.Items.keys.toList()[index],
              title: cardProvide.Items.values.toList()[index]!.title,
              price: cardProvide.Items.values.toList()[index]!.price,
              quantity: cardProvide.Items.values.toList()[index]!.quantity,
            ),
            itemCount: cardProvide.Items.length,
          ))
        ],
      ),
    );
  }
}
