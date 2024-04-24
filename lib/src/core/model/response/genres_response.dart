import 'package:zexonline/src/core/model/genre.dart';

class GenreResponse {
  String message;
  int statusCode;
  List<Genre> data;

  GenreResponse({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory GenreResponse.fromJson(Map<String, dynamic> json) {
    return GenreResponse(
      message: json['message'] ?? "",
      statusCode: json['statusCode'] ?? 0,
      data: (json['data'] as List<dynamic>).map((genreJson) => Genre.fromJson(genreJson)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'statusCode': statusCode,
      'data': data.map((genre) => genre.toJson()).toList(),
    };
  }
}
