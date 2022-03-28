
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

  final List<String> buttons = 
  [
    'C', 'DEL', '%', '/',
    '7', '8', '9', 'x',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '00', '.', '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index)
                  {
                    var c,t;
                    if(colorcheck(buttons[index])==0)
                    {
                      c = Colors.white;
                      t = Colors.deepPurple;
                    }
                    else if(colorcheck(buttons[index])==1)
                    {
                      c = Colors.deepPurple;
                      t = Colors.white;
                    }
                    else if(colorcheck(buttons[index])==3)
                    {
                      c = Colors.orange[300];
                      t = Colors.black;
                    }
                    else
                    {
                      c = Colors.purple[800];
                      t = Colors.white;
                    }
                    return MyButton(
                      buttonText: buttons[index],
                      color: c,
                      textColor: t,
                      );
                  },
                )
              ),
            ),
          ],
        ));
  }

  int colorcheck(String x)
  {
    int r = 0;
    if(x=='/' || x=='*' || x=='-' || x=='+' || x=='%' || x=='x')
    {
      r = 1;
    }
    else if(x=='=')
    {
      r = 2;
    }
    else if(x=='C' || x=='DEL')
    {
      r = 3;
    }
    return r;
  }

}
