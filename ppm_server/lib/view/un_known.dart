import 'package:flutter/material.dart';

class UnKnownView extends StatelessWidget{
  const UnKnownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      body: Center(
        child: Text("404"),
      ),
    );
  }
}