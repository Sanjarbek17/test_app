import 'package:flutter/material.dart';
import '../models/main_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Пятерочка',
      code: 'АПС-0-1036192',
      distance: 0.2,
      address: 'Химки, Мясницкая ул., 13, стр. 3',
      time: 30,
      storeType: 'buy',
    ),
    Product(
      id: 2,
      name: 'Магнит',
      code: 'АПС-0-1036192',
      distance: 2.3,
      address: 'Химки, Мясницкая ул., 13, стр. 3',
      time: 30,
      storeType: 'buy',
    ),
    Product(
      id: 3,
      name: 'Перекресток',
      code: 'АПС-0-1036192',
      distance: 2.3,
      address: 'Химки, Мясницкая ул., 13, стр. 3',
      time: 30,
      storeType: 'work',
    ),
    Product(
      id: 4,
      name: 'Пятерочка',
      code: 'АПС-0-1036192',
      distance: 2.3,
      address: 'Химки, Мясницкая ул., 13, стр. 3',
      time: 30,
      storeType: 'work',
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

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

// switcher provider
class SwitcherProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // change index
  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
