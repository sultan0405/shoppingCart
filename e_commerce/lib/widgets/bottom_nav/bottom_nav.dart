import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/bottom_provider.dart';



class MyBottom extends StatelessWidget {
  const MyBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (context, data, child){
      return BottomNavigationBar(
        currentIndex: data.selectedItem,
        onTap: (index) => data.changeRoute(index),
        showUnselectedLabels: false,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Basket',
          ),
        ]
        );
    });
  }
}
