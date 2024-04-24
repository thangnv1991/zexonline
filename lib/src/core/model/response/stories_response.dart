import 'package:zexonline/src/core/model/response/meta.dart';
import 'package:zexonline/src/core/model/story_model.dart';

class StoriesResponse {
  String message;
  int statusCode;
  List<StoryModel> data;
  Meta meta;

  StoriesResponse({
    required this.message,
    required this.statusCode,
    required this.data,
    required this.meta,
  });

  factory StoriesResponse.fromJson(Map<String, dynamic> json) {
    return StoriesResponse(
        message: json['message'] ?? "",
        statusCode: json['statusCode'] ?? 0,
        meta: Meta.fromJson(json['meta'] ?? {}),
        data: List<StoryModel>.from(json['data'].map((story) => StoryModel.fromJson(story))));
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'statusCode': statusCode,
      'data': data,
      'meta': meta.toJson(),
    };
  }
}
