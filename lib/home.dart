import 'package:flutter/material.dart';
import 'package:testing_api/api_services.dart';

import 'model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API'),),
      body: FutureBuilder(
        future: getFetchData(),
        builder: (BuildContext context,AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            CardData data=snapshot.data;
            return ListView.builder(
                itemCount: 15,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: Image.network('${data.carts[index].products[0].thumbnail}'),
                    title: Text('${data.carts[index].products[0].title}'),
                    subtitle: Text('${data.carts[index].total}'),
                    trailing: Text('${data.carts[index].products[0].price}'),
                  );
                });
          }
          else{
            return Center(child: CircularProgressIndicator());
          }

        }
      ),
    );
  }
}
