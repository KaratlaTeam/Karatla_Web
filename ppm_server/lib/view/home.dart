import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppm_server/main.dart';

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
              child: Container(
                color: Colors.cyan.shade50,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RN.quizList);
                    },
                    child: const Text('quiz'),
                  ),
                ),
              )
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
