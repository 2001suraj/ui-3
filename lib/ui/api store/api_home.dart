import 'package:flutter/material.dart';
import 'package:ui/ui/api%20store/api_service.dart';
import 'package:ui/ui/api%20store/api_single_product.dart';

import 'api_category_screen.dart';

class APIhomepage extends StatelessWidget {
  const APIhomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Api Store"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ApiCategoryScreen()));
              },
              icon: Icon(Icons.category))
        ],
      ),
      body: FutureBuilder(
          future: ApiService().getAllPost(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data[index]["title"]),
                          leading: Image.network(
                            snapshot.data[index]['image'],
                            height: 50,
                            width: 30,
                          ),
                          subtitle: Text(" price - \$ " +
                              snapshot.data[index]['price'].toString()),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ApiSingleProductPage(
                                          id: snapshot.data[index]['id'],
                                        )));
                          },
                        );
                      }));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
