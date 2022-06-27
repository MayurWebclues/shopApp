import 'package:cluesapps/providers/p_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProductDetails extends StatelessWidget {
  static const String routeName = '/prduct-details';
 /* final String title;
  final double price;
  const ProductDetails(this.title,{Key? key}) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    var routeArgument = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    var id=routeArgument['id'];
    var title=routeArgument['title'];
    var imageUrl=routeArgument['imageUrl'];
    var items =Provider.of<ProductProvider>(context).findById(id.toString());

    return Scaffold(
      appBar: AppBar(title: Text(items.title),centerTitle: true,),
    );
  }
}
