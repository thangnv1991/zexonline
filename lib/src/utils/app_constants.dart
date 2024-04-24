import 'package:flutter/material.dart';

class AppConstants {
  // Base name
  static const String appName = "Flutter Basic";
  static const String appDatabaseName = "FlutterBasicDB"; //no Space

  // Base url
  static const String API_PROD_URL = "https://api.ttchutech.com/api/v1";
  static const String API_DEV_URL = "https://api.ttchutech.com/api/v1";
  static const String API_LOCAL_URL = "https://api.ttchutech.com/api/v1";

  // Link demo image when make UI
  // 150x150: width x height => we can change it.
  static const String demoImageUrl = "http://via.placeholder.com/150x150";

  // Key header of Retrofit
  static const String keyAccept = "Accept";
  static const String keyAuth = "Authorization";

  static const String patternEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  // SlackHandle Catcher
  static const String slackWebHookUrl = "";
  static const String slackChannel = "#catcher";
  static const String slackUserName = "CatcherTest";
  static const String slackIconEmoji = ":thinking_face:";

  //Deeplink
  static const IOS_STORE_ID = '0000000';

  static const bottomSheetBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    ),
  );

  /// Types
  static const String image = 'image';
  static const String video = 'video';

  static const String appStoreId = '';
  static const String microsoftStoreId = '';
  static const String facebookUrl = 'https://www.facebook.com/';

  static String domainImage(String key) =>
      'https://pub-9b66aa2beaa54e95996483b056ca9bd8.r2.dev/$key';

  static String aboutUsUrl = 'https://zexmanga.online/thong-tin/ban-quyen';
  static String termUrl = 'https://zexmanga.online/thong-tin/dieu-khoan-dich-vu';
  static String privacyUrl = 'https://zexmanga.online/thong-tin/chinh-sach-bao-mat';
}
