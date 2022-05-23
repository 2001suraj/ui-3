import 'package:flutter/material.dart';
import 'package:ui/ui/movie-api/movie_api_service.dart';

class MovieApiHomeScreen extends StatelessWidget {
  const MovieApiHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie api"),
      ),
      body: FutureBuilder(
          future: MovieApi().getMovies(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: Text(snapshot.data[index]["name"]),
                    );
                  }));
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
