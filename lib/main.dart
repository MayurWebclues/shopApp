import 'package:cluesapps/providers/p_cart.dart';
import 'package:cluesapps/providers/p_orders.dart';
import 'package:cluesapps/providers/p_products.dart';
import 'package:cluesapps/screens/cart_screen.dart';
import 'package:cluesapps/screens/order_screen.dart';
import 'package:cluesapps/screens/product_detail_screen.dart';
import 'package:cluesapps/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrdersProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.pink,
              accentColor: Colors.greenAccent,
              errorColor: Colors.red,
              backgroundColor: Colors.white38,
            ),
            textTheme: ThemeData.light().textTheme.copyWith(
                  labelLarge: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                  ),
                )),
        routes: {
          '/': (ctx) => ProductOverViewScreen(),
          ProductDetails.routeName: (ctx) => ProductDetails(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
        },
      ),
    );
  }
}
