import 'package:cluesapps/providers/p_products.dart';
import 'package:cluesapps/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrids extends StatelessWidget {
  var showFavoriteOnly;
  ProductGrids(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final prodcutItem = showFavoriteOnly ? productData.favitems :productData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: prodcutItem.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8),
        itemBuilder: (context, index) => ChangeNotifierProvider.value( value: prodcutItem[index],
              /*create: (BuildContext context) => prodcutItem[index],*/
              child: ProductItem(
                  /*prodcutItem[index].id,
                  prodcutItem[index].title, prodcutItem[index].imageUrl*/),
            ));
  }
}
