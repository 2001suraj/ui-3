import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui/ui/bmi/bmi_result_screen.dart';

class BMIHomeScreen extends StatefulWidget {
  const BMIHomeScreen({Key? key}) : super(key: key);

  @override
  State<BMIHomeScreen> createState() => _BMIHomeScreenState();
}

class _BMIHomeScreenState extends State<BMIHomeScreen> {
  static const active = Colors.purple;
  static const inactive = const Color.fromARGB(255, 15, 3, 17);
  Color maleColor = active;
  Color femaleColor = inactive;
  double height = 120;
  int initialAge = 50;
  int initialWeight = 50;
  c(int gender) {
    if (gender == 1) {
      if (maleColor == active) {
        maleColor = inactive;
        femaleColor = active;
      }
    } else {
      maleColor = active;
    }
    if (gender == 2) {
      if (femaleColor == active) {
        femaleColor = inactive;
        maleColor = active;
      }
    } else {
      femaleColor = active;
    }
  }

  late double _bmi;
  String result() {
    _bmi = initialWeight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  getresult() {
    if (_bmi <= 18.5) {
      return "	Underweight";
    } else if (_bmi >= 18.5 && _bmi <= 22.9) {
      return " Normal";
    } else if (_bmi >= 23 && _bmi <= 24.9) {
      return " Overweight";
    } else {
      return "	Obese";
    }
  }

  getresultdetails() {
    if (_bmi <= 18.5) {
      return "	If your BMI is less than 18.5, then it means that you are underweight.To avoid health complications that may arise due to low levels of body fat,you need to put on more weight.Make sure you get in touch with your doctor or a dietician for professional insight and advice.";
    } else if (_bmi >= 18.5 && _bmi <= 22.9) {
      return " If you have a BMI that falls in between 18.5 to 22.9, then it means that you have a healthy weight in relation to your height. This is your normal BMI range. When you maintain a healthy level of body fat,it means that you have a much lower risk of developing health complications.";
    } else if (_bmi >= 23 && _bmi <= 24.9) {
      return " If you have a BMI that falls in between 23.0 to 24.9, it means that you are overweight.In other words,you have a higher than ideal level of body fats considering your height.In such cases,it is important that you lose some amount of weight in order to improve your health. It is recommended that you talk to a doctor or dietician for professional advice.";
    } else {
      return "If your BMI is more than 25.0, then it indicates that you are obese,or in other words,heavily overweight.It is far from your ideal BMI and it means that you have way too much body fat in relation to your height,and this can pose serious health risks. It is important that you lose weight for health reasons. Make sure to contact your doctor or dietician for professional advice in such a situation.";
    }
  }

  getRange() {
    if (_bmi <= 18.5) {
      return "	below 18.5 kg/m2";
    } else if (_bmi >= 18.5 && _bmi <= 22.9) {
      return " 18.5 - 22.9 kg/m2";
    } else if (_bmi >= 23 && _bmi <= 24.9) {
      return " 23 - 24.9 kg/m2";
    } else {
      return "	25 and above kg/m2";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        c(1);
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: maleColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.male, size: 90, color: Colors.white),
                          FittedBox(
                            child: Text(
                              "Male",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        c(2);
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: femaleColor),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.female, size: 90, color: Colors.white),
                          FittedBox(
                            child: Text(
                              "Female",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: active,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      "${height.toStringAsFixed(1)} cm",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Slider(
                        max: 200,
                        min: 100,
                        value: height,
                        onChanged: (newheight) {
                          setState(() {
                            height = newheight;
                          });
                        })
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: active),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Weight"),
                        Text("$initialWeight"),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FloatingActionButton(
                                heroTag: Text("btn1"),
                                onPressed: () {
                                  setState(() {
                                    initialWeight++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                              FloatingActionButton(
                                heroTag: Text("btn2"),
                                onPressed: () {
                                  setState(() {
                                    initialWeight--;
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: active),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Age"),
                        Text("$initialAge"),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FloatingActionButton(
                                heroTag: Text("btn3"),
                                onPressed: () {
                                  setState(() {
                                    initialAge++;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                              FloatingActionButton(
                                heroTag: Text("btn4"),
                                onPressed: () {
                                  setState(() {
                                    initialAge--;
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Color.fromARGB(255, 176, 241, 101),
              onPressed: () {
                var first = result();
                var second =  getresult();
                 var third = getresultdetails();
                 var fouth = getRange();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BMIResultPage(
                      first: second,
                      second:first,
                      third:third,
                      fouth: fouth,
                    )));
              },
              child: Text(
                "Calculate",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
