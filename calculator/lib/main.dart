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

  final List<String> buttons = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Column(
          children: <Widget>[
            Expanded(
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
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(fontSize: 35,  fontWeight: FontWeight.bold),
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
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (colorcheck(buttons[index]) == 0) {
                    // Numbers and dot
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.white,
                      textColor: Colors.deepPurple,
                    );
                  } else if (colorcheck(buttons[index]) == 1) {
                    // Operators
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                    );
                  } else if (colorcheck(buttons[index]) == 3) {
                    // C
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.orange[300],
                      textColor: Colors.black,
                    );
                  } else if (colorcheck(buttons[index]) == 4) {
                    // DEL
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userQuestion = userQuestion.substring(0,userQuestion.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.orange[300],
                      textColor: Colors.black,
                    );
                  } else if (colorcheck(buttons[index]) == 5) {
                    // ANS
                    return MyButton(
                      buttontapped: () {
                        setState(() {
                          userQuestion = userAnswer;
                        });
                      },
                      buttonText: buttons[index],
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
                      buttonText: buttons[index],
                      color: Colors.purple[800],
                      textColor: Colors.white,
                    );
                  }
                },
              )),
            ),
          ],
        ));
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
      r=5;
    }
    return r;
  }

  void equalTapped(){
    String finalQuestion = userQuestion;
    finalQuestion= finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }

}
