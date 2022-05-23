import 'package:flutter/material.dart';
import 'package:ui/ui/bmi/bmi_home_screen.dart';

class BMIResultPage extends StatelessWidget {
  BMIResultPage(
      {Key? key,
      required this.first,
      required this.second,
      required this.third,
      required this.fouth})
      : super(
          key: key,
        );
  String first;
  String second;
  String third;
  String fouth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(" Your Result"),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text("$first",
                            style: TextStyle(
                                color: Color.fromARGB(255, 6, 231, 14),
                                fontSize: 20)),
                        Text("$second",
                            style: TextStyle(
                                color: Color.fromARGB(255, 70, 51, 179),
                                fontSize: 20)),
                        Text("Normal  Range : "),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("$fouth",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 65, 19, 57),
                                  fontSize: 20)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                              child: Text("$third",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 13, 32, 14),
                                      fontSize: 20))),
                        ),
                        RaisedButton(
                          color: Colors.limeAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {},
                          child: Text("Save"),
                        ),
                        SizedBox(height: 30),
                      ],
                    )),
              ),
            ),
            RaisedButton(
              color: Colors.cyan,
              padding: EdgeInsets.symmetric(horizontal: 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BMIHomeScreen()));
              },
              child: Text("Re-calculate"),
            ),
          ],
        ),
      ),
    );
  }
}
