import 'package:e_commerce/models/store.dart';
import 'package:e_commerce/models/harytlar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Basket extends StatelessWidget {
  const Basket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Sebet")),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Consumer<StateData>(builder: (context, data, child) {
            // TODO: ASHAKDA HALI WIDGET RETURN ATMASDAN ATDI, SHU WIDGETLANI
            // ICHINDA ULANJAK DATALARYNY VARIABLE'LARA KOYUP CYK. SONG ANGSAT BOLADY.
            // E.G var isCartEmpty = data.sebet.isEmpty();

            // TODO: BERDA INDI CONDITION'LARNY GORIP CYK. HAZY SANI CART'YNGDA 2
            // CONDITION BOLUP BILADI. 1. BOSH 2. BOSH AMAS. HANDLE THEM HERE.
            // E.G if (isCartEmpty) {
            //   return Text("Sebediniz bosh");
            // }
            // 2 IHTIMAL BOLGANI UCIN BIRSINI IF LASANG ASHAKDAKI ELSE DAMAK UJE
            // UNY ELSE DAMAK GARAKMIDI.

            return ListView.builder(
                itemCount:
                    data.sebet.length < 0 ? data.getLenght : data.sebet.length,
                itemBuilder: (context, i) {
                  return Card(
                      child:
                          // TODO: BU CONDITION CHECKING'I BERDA ATMAK GARAKMIDI.
                          // WIDGETLANI ARASYNDA LOGIC ULANMALY AMAS. YUKARDA
                          // RETURN'DAN YUKARDA AT NOWY CHECKING ATJAK BOLSANG.
                          data.sebet.length < 0
                              ? ListTile(
                                  title: Text(data.onNull[i].title),
                                  tileColor: Colors.red[400],
                                )
                              : ListTile(
                                  title: Text(data.sebet[i].name),
                                  subtitle:
                                      Text('cost :${data.sebet[i].price} USD'),
                                  trailing: IconButton(
                                      onPressed: () {
                                        data.selectedHaryt(data.sebet[i]);
                                        data.removeItem(Haryt(
                                            name: data.sebet[i].name,
                                            price: data.sebet[i].price,
                                            id: data.sebet[i].id));
                                      },
                                      icon: Icon(
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
