import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart';

class ProductService {
  static Future<List<Product>> fetchProducts() async {
    final uri = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
