import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SnakeHomeScreen extends StatefulWidget {
  const SnakeHomeScreen({Key? key}) : super(key: key);

  @override
  State<SnakeHomeScreen> createState() => _SnakeHomeScreenState();
}

class _SnakeHomeScreenState extends State<SnakeHomeScreen> {
  static int numcell = 500;
  int count = 0;
  var snakeposition = [5, 25, 45];
  static var randonnumber = Random();
  int food = randonnumber.nextInt(numcell);
  var direction = "down";
  startgame() {
    snakeposition = [5, 25, 45];
    direction = 'down';
    const duration = Duration(milliseconds: 100);
    Timer.periodic(duration, (timer) {
      count += 50;
      if (count > 500 - snakeposition.length * 50) {
        count = 0;
        setState(() {
          updatesnake();
          if (snakeposition.last == food) {
            food = randonnumber.nextInt(numcell);
          } else {
            snakeposition.removeAt(0);
          }
        });
        if (gameover()) {
          timer.cancel();
          showgameover();
        }
      }
    });
  }

  showgameover() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Game over"),
            content: Text("score : ${(snakeposition.length - 3).toString()}"),
            actions: [
              FlatButton(
                  onPressed: () {
                    startgame();
                    Navigator.pop(context);
                  },
                  child: Text("Try again"))
            ],
          );
        });
  }

  bool gameover() {
    var distinct = snakeposition.toSet().toList();
    if (distinct.length == snakeposition.length) {
      return false;
    } else {
      return true;
    }
  }

  updatesnake() {
    switch (direction) {
      case 'down':
        if (snakeposition.last > (numcell - 20)) {
          snakeposition.add(snakeposition.last + 20 - numcell);
        } else {
          snakeposition.add(snakeposition.last + 20);
        }
        break;
      case 'up':
        if (snakeposition.last < 20) {
          snakeposition.add(snakeposition.last - 20 + numcell);
        } else {
          snakeposition.add(snakeposition.last - 20);
        }
        break;
      case 'left':
        if ((snakeposition.last  +1)% 20 == 0) {
          snakeposition.add(snakeposition.last + 19);
        } else {
          snakeposition.add(snakeposition.last - 1);
        }
        break;
      case 'right':
        if ((snakeposition.last + 1) % 20 == 0) {
          snakeposition.add(snakeposition.last - 19);
        } else {
          snakeposition.add(snakeposition.last + 1);
        }
        break;

      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 114, 114),
      appBar: AppBar(title: Text("Snake game ")),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (direction != 'up' && details.delta.dy > 0) {
                      direction = 'down';
                    } else if (direction != 'down' && details.delta.dy < 0) {
                      direction = 'up';
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    if (direction != 'left' && details.delta.dx > 0) {
                      direction = 'right';
                    } else if (direction != 'right' && details.delta.dx <0) {
                      direction = 'left';
                    }
                  },
                  child: Container(
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 20,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1),
                        itemCount: numcell,
                        itemBuilder: (context, index) {
                          if (snakeposition.contains(index)) {
                            return Container(
                                color: Color.fromARGB(255, 177, 29, 29));
                          } else if (food == index) {
                            return Container(
                                color: Color.fromARGB(255, 37, 36, 134));
                          } else
                            return Container(
                                color: Color.fromARGB(255, 241, 239, 239));
                        }),
                  ),
                ),
              ),
              Container(
                // height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: startgame,
                      child: Text("Start"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Text("score : ${(snakeposition.length - 3).toString()} ")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
