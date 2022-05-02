import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

  const MyButton({Key? key, this.color, this.textColor, required this.buttonText, this.buttontapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(child: Text(buttonText, style: TextStyle(color: textColor, fontSize: 22),)),
          ),
        ),
      ),
    );
  }
}