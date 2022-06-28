import 'package:cluesapps/screens/order_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop,color: Theme.of(context).primaryColorDark,),
            title: Text('Shop',style: Theme.of(context).textTheme.bodyText1),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_cart,color: Theme.of(context).primaryColorDark,),
            title: Text('Orders',style: Theme.of(context).textTheme.bodyText1,),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          )
        ],
      ),
      elevation: 4.0,
    );
  }
}
