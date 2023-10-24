import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lover_stories/View/homeV.dart';
import 'package:lover_stories/main.dart';
import 'package:lover_stories/type_def.dart';
import 'package:rive/rive.dart';

import 'Logic/rootL.dart';

class FirstView extends StatefulWidget{
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView>{

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RL>(
      builder: (_){
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Center(
              child: PageTransitionSwitcher(
                reverse: false,
                transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    ) {
                  return SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.scaled,
                    child: child,
                  );
                },
                child: _getTransPage(_),
              ),
            ),
          ),
        );
      },
    );
  }

  _getTransPage(RL _){
    if(_.rS.firstPageTrans.trans == 0){
      return _FirstPage();
    }else if(_.rS.firstPageTrans.trans == 1){
      return _SecondPage();
    }else if(_.rS.firstPageTrans.trans == 2){
      return const HomeView();
    }
    //return const HomeView();
  }

}

class _SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RL>(
      builder: (_){
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  height: 500,
                  width: 500,
                  child: RiveAnimation.asset('assets/rives/51-68-heart.riv'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RL>(
      builder: (_){
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Center(
                  child: Container(
                    //height: Get.height,
                    //width: Get.width,
                    child: const RiveAnimation.asset('assets/rives/3239-6827-errplane.riv',fit: BoxFit.contain,),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: Get.height/14),
                  child: Container(
                    height: Get.height/4,
                    width: Get.width,
                    child: const RiveAnimation.asset('assets/rives/helix_loader.riv',fit: BoxFit.contain,),
                  )
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: Get.height/6),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue.withOpacity(0.5)),
                    foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                  ),
                  child: const Text("Who is July's lover?"),
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (c) {
                          return AlertDialog(
                            title: const Text("Lover's Name"),
                            //icon: Icon(Cupertinoicons),
                            content: Container(
                              child: TextField(
                                onChanged: (text){
                                  if(text == 'Sirens'||text == 'sirens'){
                                    Get.back();
                                    _.updateTrans(1);
                                    _.timerToName(RN.home, type: RouteType.oFF);
                                  }
                                },
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}