import 'dart:math';

import 'package:e_commerce/AppConsts/app_const.dart';
import 'package:e_commerce/init/extension/string_extencion.dart';
import 'package:e_commerce/init/locale_keys.g.dart';
import 'package:e_commerce/pages/basket/provider/basket_provider.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/pages/home/provider/home_provider.dart';
import 'package:e_commerce/widgets/text/locale_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ProductProvider>(context);
    return ChangeNotifierProvider(
      create: (_)=> HomeProvider(),
        child: SafeArea(
      child: Scaffold(
        appBar:AppBar(title: LocaleText(text: LocaleKeys.home_title),
          actions: [
            Container(
              width: 100,
              height: 40,
              alignment: Alignment.center,
              child: Row(
                children: [
                    Expanded(
                      child: FloatingActionButton(
                        onPressed: (){
                          
                            context.setLocale(AppConstant.SUPPORTED_LANGS[Random().nextInt(AppConstant.SUPPORTED_LANGS.length)]);
                          },
                        child: Text(context.locale.languageCode, style: TextStyle(color: Colors.white),)),
                    ),
                    SizedBox(width: 10,),
                   Expanded(child: LocaleText(text: LocaleKeys.home_basket_count)),
                  Expanded(child: Text("${data.productCount} ")),
                ],
              ))
          ],
        ),
        body: HomePage(data: data),
      )
    )
       );
    
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ProductProvider data;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  


  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<HomeProvider>(context);

    // bool isProductListEmpty = productData.products.isEmpty;

    if (productData.errorText.isNotEmpty) {
      return Center(child: Card(
        color: Colors.red[600],
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Error : \n Problem with products...', style:  TextStyle(color: Colors.white),),
        )),); 
    }
    return productData.isLoading
    ? Center(child: CircularProgressIndicator(),) 
    : Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productData.products.length,
              itemBuilder: (context, i){
                return Card(child:
                 ListTile(
                  title: Text(productData.products[i].name),
                  subtitle: Text('cost :  ${productData.products[i].price} USD'),
                  trailing: IconButton(onPressed: (){
                    widget.data.addItem(Product(name: productData.products[i].name, price: productData.products[i].price, id: productData.products[i].id));  
                    }, 
                    icon:const  Icon(Icons.add, color: Colors.blueAccent,))
                  ),
                  );
            }),
          ),
          Expanded(child: Row(
            children: [
               LocaleText(text: LocaleKeys.home_total_price),
              Text(": ${widget.data.totalPrice} USD"),
            ],
          ))
        ],
      )
      );
  }


}