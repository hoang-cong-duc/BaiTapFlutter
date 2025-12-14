import 'package:flutter/material.dart';
import 'product.dart';
import 'Product_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    _products = await ProductService.fetchProducts();

    _isLoading = false;
    notifyListeners();
  }
}
