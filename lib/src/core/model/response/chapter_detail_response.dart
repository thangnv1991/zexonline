import 'package:zexonline/src/core/model/chapter_model.dart';
import 'package:zexonline/src/core/model/response/meta.dart';

class ChapterDetailResponse {
  String? message;
  int? statusCode;
  ChapterModel? data;
  Meta? meta;

  ChapterDetailResponse({
    this.message,
    this.statusCode,
    this.data,
    this.meta,
  });

  factory ChapterDetailResponse.fromJson(Map<String, dynamic> json) {
    return ChapterDetailResponse(
        message: json['message'] ?? "",
        statusCode: json['statusCode'] ?? 0,
        meta: Meta.fromJson(json['meta'] ?? {}),
        data: ChapterModel.fromJson(json['data'] ?? {}));
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
