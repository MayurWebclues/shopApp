import 'package:cluesapps/providers/p_orders.dart';
import 'package:cluesapps/widgets/appdrawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/order_item.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = "/orders";

  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  @override
  Widget build(BuildContext context) {
    var orderData = Provider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => OrderItemsList(orderData.orders[index]),
        itemCount: orderData.orders.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
