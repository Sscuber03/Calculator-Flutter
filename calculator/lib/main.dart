import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

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
    '00',
    '.',
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
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(fontSize: 20),
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
                  } else {
                    // Equals
                    return MyButton(
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
    }
    return r;
  }
}
