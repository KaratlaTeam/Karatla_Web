import 'package:get/get.dart';
import 'package:ppm_server/logic/home_l.dart';


class HomeBinding implements Bindings{
  @override
  void dependencies() {
    printInfo(info: 'HomeBinding called');
    Get.put(HomeL());
  }

}
