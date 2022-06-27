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
  late Map<String, CartItem> _items={};

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

  int get itemCount {
    return _items.length;
  }
}
