import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future getAllPost() async {
    final allProductApi = Uri.parse("https://fakestoreapi.com/products");
    final result = await http.get(allProductApi);
    // print(result.statusCode);
    // print(result.body);
    return json.decode(result.body);
  }

  Future getSingleProduct(int id) async {
    final SingleProductURl = Uri.parse('https://fakestoreapi.com/products/$id');
    final SingleProductResult = await http.get(SingleProductURl);
    // print(SingleProductResult.statusCode);
    // print(SingleProductResult.body);
    return json.decode(SingleProductResult.body);
  }

  Future getCategory() async {
    final CategoryURL =
        Uri.parse('https://fakestoreapi.com/products/categories');
    final Categoryresult = await http.get(CategoryURL);
    print(Categoryresult.statusCode);
    print(Categoryresult.body);
    return json.decode(Categoryresult.body);
  }

  Future getCategoryProduct(String cate) async {
    final categoryproductURL =
        Uri.parse("https://fakestoreapi.com/products/category/$cate");
    final categoryproductresult = await http.get(categoryproductURL);
    print(categoryproductresult.statusCode);
    print(categoryproductresult.body);

    return json.decode(categoryproductresult.body);
  }
}
