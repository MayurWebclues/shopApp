
import 'package:flutter/material.dart';

import 'p_cart.dart';

class OrderItem{
   final String id ;
   final double amount ;
   final List<CartItem> product;
   final DateTime dateTime ;

   OrderItem(this.id, this.amount, this.product, this.dateTime);
}
class OrdersProvider with ChangeNotifier{

     List<OrderItem> _orderItem=[];

     List<OrderItem> get orders{
       return [..._orderItem];
     }

     void addOrder(List<CartItem> products,double total){
           _orderItem.insert(0, OrderItem(DateTime.now().toString(),total,products , DateTime.now()));
           notifyListeners();
     }


}