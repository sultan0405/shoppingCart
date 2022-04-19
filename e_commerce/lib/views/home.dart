import 'package:e_commerce/models/store.dart';
import 'package:e_commerce/models/harytlar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(title: Text('Harytlar'),),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: harytlar.length,
            itemBuilder: (context, i){
              return Card(child:Consumer<StateData>(builder: (context, data, child){
                return ListTile(
                title: Text('${harytlar[i].name}'),
                subtitle: Text('cost :  ${harytlar[i].price} USD'),
                trailing: IconButton(onPressed: (){
                  data.addItem(Haryt(name: harytlar[i].name, price: harytlar[i].price, id: harytlar[i].id));  
                  }, 
                  icon: Icon(Icons.add, color: Colors.blueAccent,))
                ); 
              })
                );
          })
          ),
      )
    );
  }
}