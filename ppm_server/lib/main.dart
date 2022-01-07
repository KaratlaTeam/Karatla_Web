import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppm_server/binding.dart';
import 'package:ppm_server/view/home.dart';
import 'package:ppm_server/view/quiz_list.dart';
import 'package:ppm_server/view/un_known.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PPM WEB SERVER',
      enableLog: true,
      initialBinding: HomeBinding(),
      initialRoute: RN.home,
      unknownRoute: GetPage(name: RN.unKnown, page: () => UnKnownView(key: key,)),
      getPages: _getPages(),
      routingCallback: _routingCallback(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
        onInit: (){
          printInfo(info: "onInit-------");
        },
        onReady: (){
          printInfo(info: "onReady-------");
        },
        onDispose: (){
          printInfo(info: "onDispose");
        }
    );
  }

  List<GetPage> _getPages(){
    final List<GetPage> _pageList = [
      GetPage(name: RN.home, page: () => HomeView(key: key,),),
      GetPage(name: RN.quizList, page: () => QuizListView(key: key,),),
      GetPage(name: RN.unKnown, page: () => UnKnownView(key: key,),),
    ];
    return _pageList;
  }

  ValueChanged<Routing?>? _routingCallback(){
    return (routing) {
      if(routing!.current == RN.home){
        printInfo(info: 'home');
      }
    };
  }

}

class RN{
  static const String home = '/home';
  static const String quizList = '$home/quizList';
  static const String unKnown = '/unKnown';
}
