import 'package:zexonline/src/core/model/response/meta.dart';
import 'package:zexonline/src/core/model/story_model.dart';

class StoryDetailResponse {
  String? message;
  int? statusCode;
  StoryModel? data;
  Meta? meta;

  StoryDetailResponse({
    this.message,
    this.statusCode,
    this.data,
    this.meta,
  });

  factory StoryDetailResponse.fromJson(Map<String, dynamic> json) {
    return StoryDetailResponse(
        message: json['message'] ?? "",
        statusCode: json['statusCode'] ?? 0,
        meta: Meta.fromJson(json['meta'] ?? {}),
        data: StoryModel.fromJson(json['data'] ?? {}));
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'statusCode': statusCode,
      'data': data?.toJson(),
      'meta': meta?.toJson(),
    };
  }
}
