import 'dart:async';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lover_stories/Model/rootM.dart';
import 'package:lover_stories/State/rootS.dart';
import 'package:lover_stories/View/homeV.dart';
import 'package:lover_stories/main.dart';
import 'package:lover_stories/type_def.dart';
import 'package:get/get.dart';

class RL extends GetxController with StateMixin<RS>{
  late RS rS;
  Timer timer = Timer(const Duration(seconds: 0), () { });

  @override
  Future<void> onInit()async{
    initializeData();

    //timerToName(RN.home, type: RouteType.oFF);

    super.onInit();
  }


  @override
  void dispose() {
    super.dispose();

    timer.cancel();

  }

  initializeData(){
    rS = RS(
      rM: RM(),
      firstPageTrans: FirstPageTrans(),
      timeLine: TimeLine(),
    );
  }

  timerToName(String name, {RouteType type = RouteType.tO, int second = 3}){
    switch(type){
      case RouteType.tO: {
        timer = Timer(Duration(seconds: second), () {
          Get.toNamed(name);
        });
      }
      break;

      case RouteType.oFF: {
        Timer.periodic(const Duration(seconds: 1), (timer) {
          //printInfo(info: timer.tick.toString());
          if(second == 0){
            //Get.offNamed(name);
            rS.firstPageTrans.trans = 2;
            //rS.firstPageTrans.dialog = true;
          }else{
            rS.rM.tick = timer.tick;
            //printInfo(info: rS.rM.tick.toString());
            second--;
          }
          update();
        });
      }
      break;

    }
    update();
  }

  updateTrans(int i){
    rS.firstPageTrans.trans = i;
    update();
  }

  updateYear(int year){
    rS.timeLine.year = year;
    update();
  }

  updateTimeLineOpen(){
    rS.timeLine.open = !rS.timeLine.open;
    update();
  }

  updateMemory(String s){
    rS.timeLine.memory = s;
    update();
  }

  updateSteeper(int s){
    rS.timeLine.stepper = s;
    update();
  }

}