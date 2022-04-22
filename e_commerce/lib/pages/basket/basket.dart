import 'package:e_commerce/init/locale_keys.g.dart';
import 'package:e_commerce/pages/basket/provider/basket_provider.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/widgets/text/locale_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Basket extends StatelessWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: LocaleText(text: LocaleKeys.basket_title)),
        body: Padding(
          padding:const EdgeInsets.all(15.0),
          child: Consumer<ProductProvider>(builder: (context, data, child) {
            // TODO: ASHAKDA HALI WIDGET RETURN ATMASDAN ATDI, SHU WIDGETLANI
            // ICHINDA ULANJAK DATALARYNY VARIABLE'LARA KOYUP CYK. SONG ANGSAT BOLADY.
            // E.G var isCartEmpty = data.sebet.isEmpty();
            int _itemCount = data.basket.length;
            bool isBasketEmpty = data.basket.isEmpty;

            if (isBasketEmpty) {
              return Container(
                width: 500,
                height: 30,
                color: Colors.red[300],
                alignment: Alignment.center,
                child:  LocaleText(text: LocaleKeys.basket_empty_basket, style: TextStyle(color: Colors.red[400]),)
                );
                // Text("Sebet bosh...", style: TextStyle(color: Colors.white),));
            }
              

            // TODO: BERDA INDI CONDITION'LARNY GORIP CYK. HAZY SANI CART'YNGDA 2
            // CONDITION BOLUP BILADI. 1. BOSH 2. BOSH AMAS. HANDLE THEM HERE.
            // E.G if (isCartEmpty) {
            //   return Text("Sebediniz bosh");
            // }
            // 2 IHTIMAL BOLGANI UCIN BIRSINI IF LASANG ASHAKDAKI ELSE DAMAK UJE
            // UNY ELSE DAMAK GARAKMIDI.

            return ListView.builder(
                itemCount: 
                   _itemCount,
                itemBuilder: (context, i) {
                  return Card(
                      child:
                          // TODO: BU CONDITION CHECKING'I BERDA ATMAK GARAKMIDI.
                          // WIDGETLANI ARASYNDA LOGIC ULANMALY AMAS. YUKARDA
                          // RETURN'DAN YUKARDA AT NOWY CHECKING ATJAK BOLSANG.
                           ListTile(
                                  title: Text(data.basket[i].name),
                                  subtitle:
                                      Text('cost :${data.basket[i].price} USD'),
                                  trailing: IconButton(
                                      onPressed: () {
                                        data.selectedProduct(i);
                                        data.removeItem(Product(
                                            name: data.basket[i].name,
                                            price: data.basket[i].price,
                                            id: data.basket[i].id));
                                      },
                                      icon:const  Icon(
                                        Icons.delete_forever,
                                        color: Colors.red,
                                      )),
                                ));
                });
          }),
        ),
      ),
    );
  }
}
