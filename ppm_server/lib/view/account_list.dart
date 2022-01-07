import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppm_server/logic/home_l.dart';
import 'package:ppm_server/state/home_s.dart';

class QuizListView extends StatelessWidget{
  QuizListView({Key? key}) : super(key: key);
  final HomeS? _homeS = Get.find<HomeL>().homeS;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Scrollbar(
        child: ListView.builder(
            itemCount: _homeS!.questionDataModel.questionDataModelDetail.questionPart1.questionData.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(_homeS!.questionDataModel.questionDataModelDetail.questionPart1.questionData[index].id.toString()),
                title: Text(_homeS!.questionDataModel.questionDataModelDetail.questionPart1.questionData[index].question.questionDetail),
                trailing: Text(_homeS!.questionDataModel.questionDataModelDetail.questionPart1.questionData[index].answer),
              );
            }
        ),
      ),
    );
  }
}