class SettingModel {
  final bool notification;

  SettingModel({required this.notification});

  factory SettingModel.fromJson(Map<String, dynamic> json) {
    return SettingModel(
      notification: json['notification'] ?? false,
    );
  }
}
