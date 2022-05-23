import 'package:flutter/material.dart';
import 'package:ui/ui/bmi/bmi_home_screen.dart';
import 'package:ui/ui/todo/screen/auth/login_screen.dart';

import 'ui/api store/api_home.dart';
import 'ui/movie-api/movie_api_home_screen.dart';
import 'ui/snake game/snake_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ui's",
      theme: ThemeData(primaryColor: Colors.pink),
      home: BMIScaffold(),
    );
  }
}

class BMIScaffold extends StatelessWidget {
  const BMIScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("simple application with functionality")),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration:Duration(seconds:1),
                  content: Text("BMI Calculator"),
                ),
              );
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BMIHomeScreen()));
            },
            child: Text("BMI Calculator"),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Todo app"),backgroundColor: Colors.blue,duration: Duration(seconds: 1),));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TodoLoginScreen()));
            },
            child:
                Align(alignment: Alignment.centerLeft, child: Text("Todo App"),),
          ),
          TextButton(
            onPressed: () {
                ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Snake game"),duration: Duration(seconds: 1),backgroundColor: Colors.green,));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SnakeHomeScreen()));
            },
            child: Align(
                alignment: Alignment.centerLeft, child: Text("snake game")),
          ),
          TextButton(
            onPressed: () {
                ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Call API"),duration: Duration(seconds: 1),backgroundColor: Colors.green,));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => APIhomepage()));
            },
            child: Align(
                alignment: Alignment.centerLeft, child: Text(" Api store")),
          ),
          TextButton(
            onPressed: () {
                ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("movie api"),duration: Duration(seconds: 1),backgroundColor: Colors.green,));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MovieApiHomeScreen()));
            },
            child: Align(
                alignment: Alignment.centerLeft, child: Text("Movies api")),
          ),
        ]),
      ),
    );
  }
}
