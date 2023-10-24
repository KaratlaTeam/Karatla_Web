
import 'package:get/get.dart';
import 'package:lover_stories/Logic/rootL.dart';

class RootBinding implements Bindings{

  @override
  void dependencies(){
    printInfo(info: 'RootBinding called');
    Get.put(RL());
  }
}