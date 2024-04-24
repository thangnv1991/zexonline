import 'package:zexonline/src/core/model/chapter_model.dart';
import 'package:zexonline/src/core/model/response/meta.dart';

class ChapterListResponse {
  String? message;
  int? statusCode;
  List<ChapterModel>? data;
  Meta? meta;

  ChapterListResponse({
    this.message,
    this.statusCode,
    this.data,
    this.meta,
  });

  factory ChapterListResponse.fromJson(Map<String, dynamic> json) {
    return ChapterListResponse(
        message: json['message'] ?? "",
        statusCode: json['statusCode'] ?? 0,
        meta: Meta.fromJson(json['meta'] ?? {}),
        data: json['data'] == null
            ? null
            : List<ChapterModel>.from(json['data'].map((story) => ChapterModel.fromJson(story))));
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'statusCode': statusCode,
      'data': data,
      'meta': meta?.toJson(),
    };
  }
}
