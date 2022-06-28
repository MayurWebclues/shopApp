import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class CartProvider with ChangeNotifier {
  late Map<String, CartItem> _items = {};

  Map<String, CartItem> get Items {
    return {..._items};
  }

  void addCartItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingValue) => CartItem(
              id: existingValue.id,
              title: existingValue.title,
              quantity: existingValue.quantity + 1,
              price: existingValue.price));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  void removeSingleITem(String productID){
     if(!_items.containsKey(productID)){
       return;
     }
     var quantTemp =_items[productID]?.quantity;
     if(quantTemp!=null && quantTemp>1){
         _items.update(productID, (item) =>CartItem(id: item.id, title: item.title, quantity: item.quantity-1, price: item.price));
     }else {
       _items.remove(productID);
     }
     notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }
  void clearCart(){
    _items={};
    notifyListeners();
  }
}
