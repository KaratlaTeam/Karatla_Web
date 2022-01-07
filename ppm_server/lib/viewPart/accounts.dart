import 'package:flutter/material.dart';
import 'package:ppm_server/view/account_list.dart';

class Accounts extends StatelessWidget{
  const Accounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: QuizListView(key: key,),
    );
  }
}