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
    var routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    var id = routeArgument['id'];
    var title = routeArgument['title'];
    var imageUrl = routeArgument['imageUrl'];
    var items = Provider.of<ProductProvider>(context).findById(id.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(items.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              child: Image.network(
                imageUrl.toString(),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Price : \$${items.price}',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontFamily: 'Lato',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                items.description,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Anton',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.start,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
