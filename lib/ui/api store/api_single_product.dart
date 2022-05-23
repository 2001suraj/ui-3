import 'package:flutter/material.dart';
import 'package:ui/ui/api%20store/api_service.dart';

class ApiSingleProductPage extends StatelessWidget {
  final int id;
   const ApiSingleProductPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Product page"),
      ),
      body: FutureBuilder(
        future: ApiService().getSingleProduct(id),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: Column(
                    children: [
                      SizedBox(height:30),
                      Image.network(
                        snapshot.data['image'],
                        height: 290,
                        width: 250,
                      ),
                      Text("Price - \$"+snapshot.data['price'].toString()),
                      Card(child: Text(snapshot.data['category']),color: Colors.cyan,),

                      Text(snapshot.data['description'])
                    ],
                  ));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
        },
        
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add_shopping_cart_outlined),
        onPressed: (){},),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    
      );
  }
}
