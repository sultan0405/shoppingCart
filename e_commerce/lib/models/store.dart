import 'package:e_commerce/models/harytlar.dart';
import 'package:e_commerce/views/account.dart';
import 'package:e_commerce/views/basket.dart';
import 'package:e_commerce/views/home.dart';
import 'package:flutter/material.dart';

class StateData with ChangeNotifier{
  double _price = 0.0;
  List<Haryt> sebet = [];
  List<OnNull> onNull = [
    // OnNull(title: "Sebet bosh...")
  ];
 
  void addItem(Haryt item){
    sebet.add(item);
    _price += item.price;
    notifyListeners();
  }

  void selectedHaryt(Haryt item){
    item.isSelected =! item.isSelected;
    notifyListeners();
  }
  void removeItem(Haryt item){
    sebet.removeWhere((e)=> e.isSelected == item.isSelected);
    _price -= item.price;
    notifyListeners();
  }



  int get getLenght=> onNull.length;

  
// Screen and routes
  int selectedItem = 0;
  final screens = [
    Home(),
    Account(),
    Basket()
  ];

  void changeRoute(int index){
    selectedItem = index;
    notifyListeners();
  }


}