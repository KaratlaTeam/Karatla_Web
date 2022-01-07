import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ppm_server/http_source.dart';
import 'package:ppm_server/model/http_model.dart';
import 'package:ppm_server/model/question_data_model.dart';
import 'package:ppm_server/state/home_s.dart';

class HomeL extends GetxController with StateMixin<HomeS> {
  HomeS? homeS;

  @override
  void onInit() {
    // TODO: implement onInit
    printInfo(info: 'onInit');
    getQuizData();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    printInfo(info: 'onReady');
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    printInfo(info: 'onClose');

    ///homeS = null;
    super.onClose();
  }

  getQuizData() async {
    HttpSource httpSource = HttpSource();
    HttpModel httpModel =
        await httpSource.requestGet(HttpSource.getQuestionJsonData + 'en');

    QuestionDataModel questionDataModel =
        QuestionDataModel.fromJson(httpModel.data);

    homeS = HomeS(questionDataModel: questionDataModel);
  }
}
