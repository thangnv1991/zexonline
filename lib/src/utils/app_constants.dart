

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

  static const String patternEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  // SlackHandle Catcher
  static const String slackWebHookUrl = "";
  static const String slackChannel = "#catcher";
  static const String slackUserName = "CatcherTest";
  static const String slackIconEmoji = ":thinking_face:";

  //Deeplink
  static const IOS_STORE_ID = '0000000';

  /// Types
  static const String image = 'image';
  static const String video = 'video';

  static const String appStoreId = '';
  static const String microsoftStoreId = '';
  static const String facebookUrl = 'https://www.facebook.com/people/ZexManga/61558615781299/';

  static String domainImage(String key) =>
      'https://pub-9b66aa2beaa54e95996483b056ca9bd8.r2.dev/$key';

  static String aboutUsUrl = 'https://zexmanga.online/thong-tin/ban-quyen';
  static String termUrl = 'https://zexmanga.online/terms.html';
  static String privacyUrl = 'https://zexmanga.online/privacy.html';
}
