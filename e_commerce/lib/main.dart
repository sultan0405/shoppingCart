import 'package:e_commerce/AppConsts/app_const.dart';
import 'package:e_commerce/pages/basket/provider/basket_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/bottom_nav/provider/bottom_provider.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
  child: MyApp(), 
  supportedLocales:  AppConstant.SUPPORTED_LANGS, 
  path:AppConstant.LANG_PATH ));
  
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return   MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => ProductProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => BottomNavProvider(),
            ),
          
          ],
        child:  MaterialApp(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            title: 'Material App',
            debugShowCheckedModeBanner: false,
            home: MyEcommerce()),
        );
  }
}

class MyEcommerce extends StatelessWidget {
  const MyEcommerce({Key? key}) : super(key: key);

  // TODO: BERDA BOTTOM NAVIGATION'NY INDEX'SYNY SETSTATE DA HAM SAKLAP BILASAN.
  // PROVIDER ULANAMAN DASANG, AYRY PROVIDER ULANMALY. CARTNIKI AYRY BY AYRY.
  // PROVIDER'A DEGISHLI KOPIRAK TUTORIAL GOR/OKA.
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (context, data, child) {
      return Scaffold(
        body: IndexedStack(
          index: data.selectedItem,
          children: data.screens),
        bottomNavigationBar: MyBottom(),
      );
    });
  }
}

class MyBottom extends StatelessWidget {
  const MyBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BottomNavProvider>(context);
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
        ]);
  }
}
