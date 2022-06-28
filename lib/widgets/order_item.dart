import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/p_orders.dart' as ord;

class OrderItemsList extends StatefulWidget {
  final ord.OrderItem orders;

  OrderItemsList(this.orders);

  @override
  State<OrderItemsList> createState() => _OrderItemsListState();
}

class _OrderItemsListState extends State<OrderItemsList> {
  var isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\S${widget.orders.amount}'),
            subtitle: Text(DateFormat.yMMMd().format(widget.orders.dateTime)),
            trailing: IconButton(
              icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
              height: min(widget.orders.product.length * 20.0 + 10, 180),
              child: ListView(children: [
                ...widget.orders.product
                    .map((items) => Row(
                          children: [
                            Text(
                              items.title,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              '${items.quantity}x \$${items.price}',
                              style: Theme.of(context).textTheme.subtitle1,
                            )
                          ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ))
                    .toList()
              ]),
            ),
        ],
      ),
    );
  }
}
