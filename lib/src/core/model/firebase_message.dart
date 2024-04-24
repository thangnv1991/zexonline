import 'package:zexonline/src/deeplink/deep_link.dart';

class FirebaseMessage {
  FirebaseMessage({
    this.id = "0",
    this.action,
    this.data = '',
  });

  String id;
  DeepLinkAction? action;
  String data;

  factory FirebaseMessage.fromJson(Map<String, dynamic> json) {
    return FirebaseMessage(
      id: json['id'] ?? "",
      action: json['action'] != null ? _parseAction(json['action']) : null,
      data: json['data'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'action': action?.toString().split('.').last,
      'data': data,
    };
  }

  FirebaseMessage copyWith({
    String? id,
    DeepLinkAction? action,
    String? data,
  }) =>
      FirebaseMessage(
        id: id ?? this.id,
        action: action ?? this.action,
        data: data ?? this.data,
      );

  static DeepLinkAction? _parseAction(String? actionString) {
    if (actionString == null) return null;
    switch (actionString) {
      case 'SYSTEM_NOTICE':
        return DeepLinkAction.SYSTEM_NOTICE;
      default:
        return null;
    }
  }
}
