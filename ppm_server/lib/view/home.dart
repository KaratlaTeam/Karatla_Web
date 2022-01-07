import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppm_server/main.dart';
import 'package:ppm_server/viewPart/accounts.dart';
import 'package:ppm_server/viewPart/home_main_part.dart';
import 'package:ppm_server/viewPart/quiz.dart';
import 'package:ppm_server/viewPart/settings.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Center(
                child: Text("PPM Backend System", style: GoogleFonts.workSans(fontWeight: FontWeight.bold, fontSize: 24),),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 5,
              child: HomeMainPart(
                key: key,
                child1: Home(key: key,),
                child2: Accounts(key: key,),
                child3: Quiz(key: key,),
                child4: Settings(key: key,),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      child: const Text("Home part"),
    );
  }
}
