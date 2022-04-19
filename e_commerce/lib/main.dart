import 'package:e_commerce/models/store.dart';
import 'package:e_commerce/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create:(context) {
        return StateData();
      }, 
      child: MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: MyEcommerce()
    )
    );
  }
}

class MyEcommerce extends StatelessWidget {
  const MyEcommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StateData>(builder: (context, data, child){
          return Scaffold(
        body: data.screens[data.selectedItem],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: data.selectedItem,
          onTap: (index)=> data.changeRoute(index),
          showUnselectedLabels: false,
          backgroundColor:Colors.blue,
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
          ),
        
         );
    }); 
  }
}