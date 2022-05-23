import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieApi {
  Future getMovies() async {
    final MoviesURL = Uri.parse('https://newsapi.org/v2/everything?q=apple&from=2022-03-26&to=2022-03-26&sortBy=popularity&apiKey=c6fe9668b80d4a55ba8c5081fb6f4b5a');
    final Resultt = await http.get(MoviesURL);
    print(Resultt.statusCode);
    print(Resultt.body);
    return json.decode(Resultt.body);
  }
}
