import 'package:flutter/material.dart';
import 'package:ui/ui/todo/widgets/drawer_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class TodoProfileScreen extends StatefulWidget {
  const TodoProfileScreen({Key? key}) : super(key: key);

  @override
  _TodoProfileScreenState createState() => _TodoProfileScreenState();
}

class _TodoProfileScreenState extends State<TodoProfileScreen> {
  void openWhatsapp() async {
    String phonenumber = "98652736593";
    var url = "https://wa.me/$phonenumber?text=HelloWorld";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('error');
      throw 'Error occured';
    }
  }

  void opengmail() async {
    String email = "ksoorajkarki@gmail.com";
    var urlmail = "mailto:$email";
    if (await canLaunch(urlmail)) {
      await launch(urlmail);
    } else {
      print('error');
      throw 'Error occured';
    }
  }

  void opencall() async {
    String call = "9861853947";
    var urlcall = "tel://:$call";
    if (await canLaunch(urlcall)) {
      await launch(urlcall);
    } else {
      print('error');
      throw 'Error occured';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 210, 115),
      appBar: AppBar(
        title: Text("Profile "),
      ),
      drawer: TodoDrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 68.0, left: 20, right: 20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 60),
                        Text(
                          "Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Job sicne 2012-2-22",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Divider(
                          height: 2,
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Contact info",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Text(
                              "Email :  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Example@gmail.com",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Text(
                              "phone number :  ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "983267309238",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildicons(
                                icon: Icons.message_outlined,
                                press: () {
                                  openWhatsapp();
                                },
                                colo: Colors.green),
                            buildicons(
                                icon: Icons.mail_outline,
                                press: () {
                                  opengmail();
                                },
                                colo: Colors.red),
                            buildicons(
                                icon: Icons.call_outlined,
                                press: () {
                                  opencall();
                                },
                                colo: Colors.brown),
                          ],
                        ),
                        SizedBox(height: 50),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 120,
                            child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.cyan,
                                onPressed: () {},
                                child: Row(children: [
                                  Icon(Icons.logout),
                                  SizedBox(width: 12),
                                  Text("Logout"),
                                ])),
                          ),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 38.0, left: 60),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/man.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildicons({icon, press, colo}) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: colo, style: BorderStyle.solid)),
          child: Icon(icon, color: colo)),
    );
  }
}
