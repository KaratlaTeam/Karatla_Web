import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/http_model.dart';

class HttpSource {
  //static const String webUrl = "https://172.23.80.1";
  static const String webUrl = "http://127.0.0.1:8080";
  //static const String webUrl = "https://www.karatla.com";

  static const String checkInternet = "https://baidu.com";
  //static const String deleteValidationCode = "$webUrl/api/account/validation/code/delete/";
  static const String getCode = "$webUrl/api/account/validation/code/";
  static const String checkCode = "$webUrl/api/account/validation/code/check/";
  static const String register = "$webUrl/api/account/new";
  static const String login = "$webUrl/api/account/login";
  static const String logout = "$webUrl/api/account/logout";
  static const String getAccount = "$webUrl/api/account/get";
  static const String checkLogin = "$webUrl/api/account/check";
  static const String checkQuestionVersion = "$webUrl/api/question/version";

  static const String getQuestionJsonData = "$webUrl/api/json/question/";
  static const String getQcademyJsonData = "$webUrl/api/json/academy/";

  static const String getQuestionImages = "$webUrl/api/images/question/";
  static const String getAcademyImages = "$webUrl/api/images/academy/";

  static const Map<String, String> headers = {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,X-Requested-With, Accept",
    "Access-Control-Allow-Methods": "GET,POST,OPTIONS,DELETE,PUT",
  };

  Future<HttpModel> requestGet(String url) async {
    print("send request get from $url");

    //var response = await Dio().head(url, queryParameters: headers);

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var json = jsonDecode(response.body);
    HttpModel httpModel = HttpModel.fromJson(json);
    print(httpModel.data.toString());

    return httpModel;
  }

  Future<HttpModel> requestPost(
    Map body,
    String url,
    Map<String, String> headers,
  ) async {
    print("send request post");
    var request = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
    print('Response status: ${request.statusCode}');
    print('Response body: ${request.body}');

    var json = jsonDecode(request.body);
    HttpModel httpModel = HttpModel.fromJson(json);
    print(httpModel.data.toString());

    return httpModel;
  }
}
