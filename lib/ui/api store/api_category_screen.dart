import 'package:flutter/material.dart';
import 'package:ui/ui/api%20store/api_service.dart';

import 'api_category_product_page.dart';

class ApiCategoryScreen extends StatelessWidget {
  const ApiCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Category Screen"),
        ),
        body: FutureBuilder(
            future: ApiService().getCategory(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ApiCategoryProductPage(cate: snapshot.data[index].toString(),)));
                        },
                        child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: EdgeInsets.all(15),
                            child: Container(
                              padding: EdgeInsets.all(40),
                              child: Text(
                                  snapshot.data[index].toString().toUpperCase(),
                                  style: TextStyle(fontSize: 25)),
                            )),
                      )
                    ]);
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
