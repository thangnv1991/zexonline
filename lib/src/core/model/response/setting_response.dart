import 'package:zexonline/src/core/model/setting_model.dart';

class SettingResponse {
  final String message;
  final int statusCode;
  final SettingModel? data;

  SettingResponse({required this.message, required this.statusCode, required this.data});

  factory SettingResponse.fromJson(Map<String, dynamic> json) {
    return SettingResponse(
      message: json['message'],
      statusCode: json['statusCode'],
      data: SettingModel.fromJson(json['data']),
    );
  }
}
