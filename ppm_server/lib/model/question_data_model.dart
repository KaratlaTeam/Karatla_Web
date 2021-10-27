import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionDataModel {
  final QuestionDataModelDetail questionDataModelDetail;

  QuestionDataModel({required this.questionDataModelDetail});

  factory QuestionDataModel.fromJson(Map<String, dynamic> json) {
    return QuestionDataModel(
      questionDataModelDetail: QuestionDataModelDetail.fromJson(json["questionDataModelDetail"]!),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> questionDataModelMap = <String, dynamic>{};
    questionDataModelMap["questionDataModelDetail"] = questionDataModelDetail.toJson();

    return questionDataModelMap;
    }

    Future setSharePQuestionDataModel(QuestionDataModel questionDataModel, String systemLanguage) async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString("questionData_$systemLanguage",json.encode(questionDataModel.toJson()));
    }

    Future<QuestionDataModel> getSharePQuestionDataModel(QuestionDataModel questionDataModel, String systemLanguage) async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var jsonBody = sharedPreferences.getString("questionData_$systemLanguage");
      if (jsonBody != null) {
          var decodeJsonBody = await json.decode(jsonBody);
          questionDataModel = QuestionDataModel.fromJson(decodeJsonBody);
      }

      return questionDataModel;
    }
}

class QuestionDataModelDetail{
  QuestionDataModelDetail({
    required this.version, required this.answerLetter, required this.choicesLetter, required this.questionPart1, required this.questionPart2, required this.questionPart3,
  });

  final double version;
  final List<String> answerLetter;
  final List<String> choicesLetter;
  final QuestionPart1 questionPart1;
  final QuestionPart2 questionPart2;
  final QuestionPart3 questionPart3;

  factory QuestionDataModelDetail.fromJson(Map<String, dynamic> json) {
    return QuestionDataModelDetail(
      version: json["version"],
      answerLetter: List<String>.from(json["answerLetter"]!) ,
      choicesLetter: List<String>.from(json["choicesLetter"]!) ,
      questionPart1: QuestionPart1.fromJson(json["questionPart1"]!),
      questionPart2: QuestionPart2.fromJson(json["questionPart2"]!),
      questionPart3: QuestionPart3.fromJson(json["questionPart3"]!),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> questionDataModelDetailMap = <String, dynamic>{};
    questionDataModelDetailMap["version"] = version;
    questionDataModelDetailMap["answerLetter"] = answerLetter;
    questionDataModelDetailMap["choicesLetter"] = choicesLetter;
    questionDataModelDetailMap["questionPart1"] = questionPart1.toJson();
    questionDataModelDetailMap["questionPart2"] = questionPart2.toJson();
    questionDataModelDetailMap["questionPart3"] = questionPart3.toJson();

    return questionDataModelDetailMap;
    }
}


class QuestionPart1 {
  List<QuestionData> questionData;

  QuestionPart1({required this.questionData});

  factory QuestionPart1.fromJson(Map<String, dynamic> json) {
    return QuestionPart1(
      questionData: (json['questionData']! as List).map((i) => QuestionData.fromJson(i)).toList() ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> questionData = <String, dynamic>{};
    questionData['questionData'] = this.questionData.map((v) => v.toJson()).toList();
    return questionData;
  }
}

class QuestionPart2 {
  List<QuestionData> questionData;

  QuestionPart2({required this.questionData});

  factory QuestionPart2.fromJson(Map<String, dynamic> json) {
    return QuestionPart2(
      questionData: (json['questionData']! as List).map((i) => QuestionData.fromJson(i)).toList() ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> questionData = <String, dynamic>{};
    questionData['questionData'] = this.questionData.map((v) => v.toJson()).toList();
    return questionData;
  }
}

class QuestionPart3 {
  List<QuestionData> questionData;

  QuestionPart3({required this.questionData});

  factory QuestionPart3.fromJson(Map<String, dynamic> json) {
    return QuestionPart3(
      questionData: (json['questionData']! as List).map((i) => QuestionData.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> questionData = <String, dynamic>{};
    questionData['questionData'] = this.questionData.map((v) => v.toJson()).toList();
    return questionData;
  }
}


class QuestionData {
  String answer;
  _Choices choices;
  int id;
  _Question question;

  QuestionData({required this.answer, required this.choices, required this.id, required this.question});

  factory QuestionData.fromJson(Map<String, dynamic> json) {
    return QuestionData(
      answer: json['answer']!,
      choices: _Choices.fromJson(json['choices']!),
      id: json['id']!,
      question: _Question.fromJson(json['question']!) ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> questionData = <String, dynamic>{};
    questionData['answer'] = answer;
    questionData['id'] = id;
    questionData['choices'] = choices.toJson();
    questionData['question'] = question.toJson();
    return questionData;
  }
}

class _Question {
  String questionDetail;
  List<String> questionDetailChoice;
  List<String> questionDetailImages;

  _Question({required this.questionDetail, required this.questionDetailChoice, required this.questionDetailImages});

  factory _Question.fromJson(Map<String, dynamic> json) {
    return _Question(
      questionDetail: json['questionDetail']!,
      questionDetailChoice: List<String>.from(json['questionDetailChoice']!),
      questionDetailImages: List<String>.from(json['questionDetailImages']!),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> questionData = <String, dynamic>{};
    questionData['questionDetail'] = questionDetail;
    questionData['questionDetailChoice'] = questionDetailChoice;
    questionData['questionDetailImages'] = questionDetailImages;
    return questionData;
  }
}

class _Choices {
  List<String> choiceDetail;
  List<String> choiceImage;

  _Choices({required this.choiceDetail, required this.choiceImage});

  factory _Choices.fromJson(Map<String, dynamic> json) {
    return _Choices(
      choiceDetail: List<String>.from(json['choiceDetail']!),
      choiceImage: List<String>.from(json['choiceImage']!),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> questionData = <String, dynamic>{};
    questionData['choiceDetail'] = choiceDetail;
    questionData['choiceImage'] = choiceImage;
    return questionData;
  }
}
