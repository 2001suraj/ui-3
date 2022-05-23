import 'package:flutter/material.dart';
import 'package:ui/ui/api%20store/api_service.dart';

import 'api_single_product.dart';

class ApiCategoryProductPage extends StatelessWidget {
  final String cate;
  const ApiCategoryProductPage({Key? key, required this.cate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("category product page"),
      ),
      body: FutureBuilder(
          future: ApiService().getCategoryProduct(cate),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ApiSingleProductPage(id:snapshot.data[index]['id'])));
                      },
                      child: ListTile(
                        leading: Image.network(
                          snapshot.data[index]['image'],
                          width: 50,
                          height: 90,
                        ),
                        title: Text(
                          snapshot.data[index]['title'],
                        ),
                        subtitle: Text("price - \$" +
                            snapshot.data[index]['price'].toString()),
                      ),
                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
