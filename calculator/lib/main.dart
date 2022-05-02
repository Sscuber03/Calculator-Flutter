import 'dart:math';

import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttonsPotrait = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  final List<String> buttonsLandscapestr = [
    'sin',
    'cos',
    'tan',
    'C',
    'DEL',
    '%',
    '/',
    'ln',
    'log',
    '!',
    '7',
    '8',
    '9',
    'x',
    'PI',
    'e',
    '^',
    '4',
    '5',
    '6',
    '-',
    '(',
    ')',
    'SQRT',
    '1',
    '2',
    '3',
    '+',
    'DEG',
    'CBRT',
    'ANS',
    '0',
    '00',
    '.',
    '=',
  ];

  // final List<String> buttonsLandscapeinv = [
  //   'arcsin',
  //   'arccos',
  //   'arctan',
  //   'C',
  //   'DEL',
  //   '%',
  //   '/',
  //   'e^x',
  //   '10^',
  //   '!',
  //   '7',
  //   '8',
  //   '9',
  //   'x',
  //   'PI',
  //   'e',
  //   '^',
  //   '4',
  //   '5',
  //   '6',
  //   '-',
  //   '(',
  //   ')',
  //   'x^2',
  //   '1',
  //   '2',
  //   '3',
  //   '+',
  //   'INV',
  //   'RAD',
  //   'DEG',
  //   '0',
  //   '.',
  //   'ANS',
  //   '=',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery.of(context).orientation == Orientation.portrait) {
          return Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userQuestion,
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userAnswer,
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                    child: GridView.builder(
                  itemCount: buttonsPotrait.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: MediaQuery.of(context).size.width / ((MediaQuery.of(context).size.height)-470),
                      ),
                  itemBuilder: (BuildContext context, int index) {
                    if (colorcheck(buttonsPotrait[index]) == 0) {
                      // Numbers and dot
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userQuestion += buttonsPotrait[index];
                          });
                        },
                        buttonText: buttonsPotrait[index],
                        color: Colors.white,
                        textColor: Colors.deepPurple,
                      );
                    } else if (colorcheck(buttonsPotrait[index]) == 1) {
                      // Operators
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userQuestion += buttonsPotrait[index];
                          });
                        },
                        buttonText: buttonsPotrait[index],
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                      );
                    } else if (colorcheck(buttonsPotrait[index]) == 3) {
                      // C
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userQuestion = '';
                            userAnswer = '';
                          });
                        },
                        buttonText: buttonsPotrait[index],
                        color: Colors.orange[300],
                        textColor: Colors.black,
                      );
                    } else if (colorcheck(buttonsPotrait[index]) == 4) {
                      // DEL
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        },
                        buttonText: buttonsPotrait[index],
                        color: Colors.orange[300],
                        textColor: Colors.black,
                      );
                    } else if (colorcheck(buttonsPotrait[index]) == 5) {
                      // ANS
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userQuestion = userAnswer;
                          });
                        },
                        buttonText: buttonsPotrait[index],
                        color: Colors.white,
                        textColor: Colors.deepPurple,
                      );
                    } else {
                      // Equals
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            equalTapped();
                          });
                        },
                        buttonText: buttonsPotrait[index],
                        color: Colors.purple[800],
                        textColor: Colors.white,
                      );
                    }
                  },
                )),
              ),
            ],
          );
        } else {
          return Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          userQuestion,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userAnswer,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    child: GridView.builder(
                  itemCount: buttonsLandscapestr.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7, 
                      childAspectRatio: MediaQuery.of(context).size.width / ((MediaQuery.of(context).size.height)-65),
                      ),
                  itemBuilder: (BuildContext context, int index) {
                    if (colorcheck(buttonsLandscapestr[index]) == 0) {
                      // Numbers, dot and functions
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            if(buttonsLandscapestr[index] == "SQRT"){
                              userQuestion += "^(1/2)";
                            }else if(buttonsLandscapestr[index] == "CBRT"){
                              userQuestion += "^(1/3)";
                            }else if(buttonsLandscapestr[index] != "DEG"){
                              userQuestion += buttonsLandscapestr[index];
                            }
                          });
                        },
                        buttonText: buttonsLandscapestr[index],
                        color: Colors.white,
                        textColor: Colors.deepPurple,
                      );
                    } else if (colorcheck(buttonsLandscapestr[index]) == 1) {
                      // Operators
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userQuestion += buttonsLandscapestr[index];
                          });
                        },
                        buttonText: buttonsLandscapestr[index],
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                      );
                    } else if (colorcheck(buttonsLandscapestr[index]) == 3) {
                      // C
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userQuestion = '';
                            userAnswer = '';
                          });
                        },
                        buttonText: buttonsLandscapestr[index],
                        color: Colors.orange[300],
                        textColor: Colors.black,
                      );
                    } else if (colorcheck(buttonsLandscapestr[index]) == 4) {
                      // DEL
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        },
                        buttonText: buttonsLandscapestr[index],
                        color: Colors.orange[300],
                        textColor: Colors.black,
                      );
                    } else if (colorcheck(buttonsLandscapestr[index]) == 5) {
                      // ANS
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userQuestion = userAnswer;
                          });
                        },
                        buttonText: buttonsLandscapestr[index],
                        color: Colors.white,
                        textColor: Colors.deepPurple,
                      );
                    } else {
                      // Equals
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            equalTapped();
                          });
                        },
                        buttonText: buttonsLandscapestr[index],
                        color: Colors.purple[800],
                        textColor: Colors.white,
                      );
                    }
                  },
                )),
              ),
            ],
          );
        }
      }),
    );
  }

  int colorcheck(String x) {
    int r = 0;
    if (x == '/' || x == '*' || x == '-' || x == '+' || x == '%' || x == 'x') {
      r = 1;
    } else if (x == '=') {
      r = 2;
    } else if (x == 'C') {
      r = 3;
    } else if (x == 'DEL') {
      r = 4;
    } else if (x == 'ANS') {
      r = 5;
    }
    return r;
  }

  void equalTapped() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
