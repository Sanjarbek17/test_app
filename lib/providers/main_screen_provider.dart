import 'package:flutter/material.dart';
import '../models/main_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Product 1',
      code: 'ABC123',
      distance: 1.5,
      address: '123 Main St.',
      time: 10,
      storeType: 'Grocery',
    ),
    Product(
      id: 2,
      name: 'Product 2',
      code: 'DEF456',
      distance: 2.3,
      address: '456 Elm St.',
      time: 15,
      storeType: 'Pharmacy',
    ),
    // add more products as needed
  ];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(int id) {
    _products.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  // add more methods as needed
}
