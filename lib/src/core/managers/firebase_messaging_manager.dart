import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/model/firebase_message.dart';
import 'package:zexonline/src/core/repository/auth_repository.dart';
import 'package:zexonline/src/deeplink/deep_link.dart';
import 'package:zexonline/src/deeplink/deeplink_manager.dart';
import 'package:zexonline/src/helper/log_helper.dart';
import 'package:zexonline/src/utils/app_shared.dart';

class FirebaseMessagingManager {
  late final AuthRepository _authRepository;
  late final DeepLinkManager _deepLinkManager;
  late final AppShared _appShared;

  FirebaseMessagingManager() {
    _appShared = Get.find<AppShared>();
    _authRepository = AuthRepository(_appShared);
    _deepLinkManager = DeepLinkManager();
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String? _latestProcessedInitialMessageId;

  setupFirebaseFCM() async {
    initNotificationsSettings();

    // Push Notification arrives when the App is in Opened and in Foreground
    FirebaseMessaging.onMessage.listen((message) {
      _handleForegroundNotification(message);
    });

    // Push Notification is clicked
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleNotificationActionFromRemoteMessage(message);
    });
  }

  Future<void> initNotificationsSettings() async {
    // Config FirebaseMessaging Plugin - Used for iOS
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  Future<void> _handleForegroundNotification(RemoteMessage message) async {
    // Xử lý khi app đang được bật
    // Update unread count
    _handleNotificationActionFromRemoteMessage(message);
  }

  /// When the user taps on a Notification with the Application close we have
  /// to consume it ones the App is completely started.
  void processInitialMessage() {
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        if (_latestProcessedInitialMessageId == null ||
            _latestProcessedInitialMessageId != message.messageId) {
          LogHelper.d('Processing Initial Message');
          _latestProcessedInitialMessageId = message.messageId;
          _handleNotificationActionFromRemoteMessage(message);
        } else {
          LogHelper.d('Initial Message Already Processed');
        }
      }
    });
  }

  void _handleNotificationActionFromRemoteMessage(RemoteMessage message) {
    LogHelper.d(
        'NEW NOTIFICATION _handleNotificationActionFromRemoteMessage ${message.toString()}');
    _handleNotificationAction(FirebaseMessage.fromJson(message.data));
  }

  void _handleNotificationAction(FirebaseMessage notificationMessage) {
    LogHelper.d('NEW NOTIFICATION ${notificationMessage.toString()}');

    performNotificationAction(notificationMessage);
  }

  void performNotificationAction(FirebaseMessage messageNotify) {
    final DeepLinkAction? action = messageNotify.action;
    DeepLink? deepLink;
    switch (action) {
      case DeepLinkAction.SYSTEM_NOTICE:
        deepLink = SystemNoticeDeepLink();
        break;
      default:
        break;
    }
    _deepLinkManager.handlerDeepLink(deepLink: deepLink);
  }

  Future<void> deleteToken() => _firebaseMessaging.deleteToken();

  Future<String?> getNotificationToken() => _firebaseMessaging.getToken();

  /// Register Firebase Token to Server
  void registerTokenFCM() async {
    await _firebaseMessaging.requestPermission(sound: true, badge: true, alert: true);
    getNotificationToken().then((firebaseToken) async {
      String? firebaseTokenLocal = _appShared.getTokenFcm();
      if (firebaseToken != null) {
        if (firebaseTokenLocal == null || firebaseTokenLocal != firebaseToken) {
          await _appShared.setTokenFcm(firebaseToken);
          _authRepository.addTokenFCMApi(firebaseToken).then((value) {});
          LogHelper.d("firebase Token: $firebaseToken");
        }
      }
    });
  }

  /// Remove Firebase Token to Server
  Future<void> clearToken() async {
    var fcmToken = await getNotificationToken();
    if (fcmToken != null && fcmToken.isNotEmpty) {
      deleteToken();
      await _appShared.setTokenFcm('');
      await _authRepository.deleteTokenFCMApi(fcmToken);
    }
  }
}
