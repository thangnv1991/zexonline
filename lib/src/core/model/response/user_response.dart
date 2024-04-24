import 'package:hive/hive.dart';

class UserResponse {
  final String message;
  final int statusCode;
  final UserData? data;

  UserResponse({required this.message, required this.statusCode, required this.data});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      message: json['message'],
      statusCode: json['statusCode'],
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    return User(
      id: reader.readString(),
      name: reader.readString(),
      email: reader.readString(),
      inviteCode: reader.readString(),
      isAdmin: reader.readBool(),
      createdAt: reader.readString(),
      updatedAt: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.email);
    writer.writeString(obj.inviteCode);
    writer.writeBool(obj.isAdmin);
    writer.writeString(obj.createdAt ?? '');
    writer.writeString(obj.updatedAt ?? '');
  }
}

class UserData {
  final String accessToken;
  final User user;

  UserData({required this.accessToken, required this.user});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      accessToken: json['access_token'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String inviteCode;
  final String? referrerCode;
  final bool isAdmin;
  final String? createdAt;
  final String? updatedAt;
  final String? subscriptionId;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.inviteCode,
    this.referrerCode,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    this.subscriptionId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      inviteCode: json['invite_code'],
      referrerCode: json['referrer_code'],
      isAdmin: json['is_admin'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      subscriptionId: json['subscription_id'],
    );
  }
}
