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
        appBar: AppBar(title:Text("Sebet")),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Consumer<StateData>(builder: (context, data, child){
            return ListView.builder(itemCount:data.sebet.length<0?data.getLenght:data.sebet.length,
            itemBuilder:(context, i) {
              return Card(
                child: data.sebet.length<0? ListTile(title: Text(data.onNull[i].title), tileColor: Colors.red[400],) :ListTile(
                  title: Text(data.sebet[i].name),
                  subtitle: Text('cost :${data.sebet[i].price} USD'),
                  trailing: IconButton(onPressed:(){
                    data.selectedHaryt(data.sebet[i]);
                    data.removeItem(Haryt(name: data.sebet[i].name, price: data.sebet[i].price, id: data.sebet[i].id));
                  } , icon: Icon(Icons.delete_forever, color: Colors.red,)),
              )
              );
            } );
          } ),
          ),
      ),
    );
  }
}