import 'package:flutter/material.dart';
import 'product.dart';

class CartProvider with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  int get count => _items.length;

  void addToCart(Product product) {
    _items.add(product);
    notifyListeners();
  }
  

  void removeFromCart(Product product) {
    _items.remove(product);
    notifyListeners();
  }
}
