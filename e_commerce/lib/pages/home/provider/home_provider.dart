
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {

bool isLoading = true;
String errorText = '';
List<Product> products = [];

HomeProvider(){
  fetchData();
}

Future<void> fetchData()async {

  try {
  await Future.delayed(const Duration(seconds:2), (){
    for (var i = 0; i < productsDb.length; i++) {
      products.add(productsDb[i]);
    }
  });
    isLoading = false;
    
  } catch (e) {
    print('caught error $e');
    errorText = e.toString();
  }

       notifyListeners();
}













}