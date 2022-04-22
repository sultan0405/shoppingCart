import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

// TODO: BIR APP'DE BIRNACE SANY NOTIFIER BOLUP BILADI.
// SHUNCUN ATLARYNY DOGRY KOYJAK BOL.
// E.G CART'NIKINI CARTNOTIFIER YADA CARTPROVIDER KOYUP BILASAN.
class ProductProvider with ChangeNotifier {
  double _price = 0.0;
  List<Product> basket = [];
  

  void addItem(Product item) {
    basket.add(item);
    _price += item.price;
    notifyListeners();
  }

  void selectedProduct(int i) {
    basket[i].isSelected =! basket[i].isSelected;
    notifyListeners();
  }

  void removeItem(Product item) {
    basket.removeWhere((e) => e.isSelected == !item.isSelected);
    _price -= item.price;
    notifyListeners();
  }

  int get productCount => basket.length;

  double get totalPrice => _price;


}