import 'package:e_commerce/pages/account/account.dart';
import 'package:e_commerce/pages/basket/basket.dart';
import 'package:e_commerce/pages/home/home.dart';
import 'package:flutter/cupertino.dart';


class BottomNavProvider with ChangeNotifier{
int selectedItem = 0;
  final screens = [Home(), Account(), Basket()];
  void changeRoute(int index) {
    selectedItem = index;
    notifyListeners();
  }
}