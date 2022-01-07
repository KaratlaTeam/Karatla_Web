import 'package:flutter/material.dart';

class HomeMainPart extends StatefulWidget {
  const HomeMainPart({
    Key? key,
    required this.child1,
    required this.child2,
    required this.child3,
    required this.child4,
  }) : super(key: key);

  final Widget child1 ;
  final Widget child2 ;
  final Widget child3 ;
  final Widget child4;

  @override
  _HomeMainPartState createState() => _HomeMainPartState();
}
class _HomeMainPartState extends State<HomeMainPart>{

  int mainIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.cyan.shade50,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    mainIndex = 0;
                  });
                },
                child: const Text('Home'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    mainIndex = 1;
                  });
                },
                child: const Text('Accounts'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    mainIndex = 2;
                  });
                },
                child: const Text('Quiz'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    mainIndex = 3;
                  });
                },
                child: const Text('Settings'),
              ),
            ],
          ),
          Expanded(
            child: _getView(mainIndex),
          ),
        ],
      ),
    );
  }

  _getView(int index){
    if(index == 0){
      return widget.child1;

    }else if(index == 1){
      return widget.child2;

    }else if(index == 2){
      return widget.child3;

    }else if(index == 3){
      return widget.child4;

    }
  }

}