import 'package:cluesapps/screens/cart_screen.dart';
import 'package:cluesapps/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/p_cart.dart';
import '../providers/p_products.dart';
import '../widgets/product_grid.dart';

enum FilterOptions { Favorites, All }

class ProductOverViewScreen extends StatefulWidget {
  const ProductOverViewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  var _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<ProductProvider>(context);
    var cartData = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.All,
                    )
                  ],
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showFavoriteOnly = true;
                  } else {
                    _showFavoriteOnly = false;
                  }
                });
              }),
          Consumer<CartProvider>(
            builder: (_, cart, chl) => Badge(
              child: chl!,
              value: cartData.itemCount.toString(),
              color: Colors.black,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName, arguments: {});
              },
            ),
          )
        ],
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Container(
        child: ProductGrids(_showFavoriteOnly),
      ),
      drawer: Drawer(),
    );
  }
}
