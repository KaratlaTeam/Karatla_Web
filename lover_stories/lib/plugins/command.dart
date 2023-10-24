// Create a custom widget like this
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyVerticalText extends StatelessWidget {
  final String text;
  final double size;
  final bool male;

  const MyVerticalText(this.text,this.size,this.male, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 30,
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      children: text.split("").map((string) => Text(string, style: TextStyle(fontSize: size,color: male ? Colors.blue : Colors.pink))).toList(),
    );
  }
}