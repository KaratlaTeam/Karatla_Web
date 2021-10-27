class HttpModel {
  int code;
  Map<String, dynamic> data;

  HttpModel({required this.code, required this.data});

  factory HttpModel.fromJson(Map<String, dynamic> json) {
    return HttpModel(
      code: json['code'],
      data: json['data'],
    );
  }
}
