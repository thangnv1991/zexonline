import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:zexonline/src/core/model/response/user_response.dart';
import 'package:zexonline/src/enums/enum_font_family.dart';
import 'package:zexonline/src/utils/app_constants.dart';

class AppShared {
  static const String keyName = AppConstants.appDatabaseName;

  //  Key to open Box
  static const String keyBox = '${keyName}_shared';

  final String _keyFcmToken = "${keyName}_keyFCMToken";
  final String _keyTokenValue = "${keyName}_keyTokenValue";
  final String _keyProfile = "${keyName}_keyProfile";
  final String _keyIdsReadNowGuest = "${keyName}_keyIdsReadNowGuest";
  final String _keyLanguageCode = "${keyName}_keyLanguageCode";
  final String _keyNovelBackground = "${keyName}_keyNovelBackground";
  final String _keyNovelTextSize = "${keyName}_keyNovelTextSize";
  final String _keyNovelFontFamily = "${keyName}_keyNovelFontFamily";

  final Box<dynamic> _box;

  AppShared(this._box);

  Box getBox() => _box;

  Future<void> setTokenFcm(String firebaseToken) async {
    _box.put(_keyFcmToken, firebaseToken);
  }

  String? getTokenFcm() => _box.get(_keyFcmToken);

  /*
  * Save Selected Locale
  */
  Future<void> setLanguageCode(String languageCode) => _box.put(_keyLanguageCode, languageCode);

  /*
  * Get Selected Locale
  */
  String? getLanguageCode() => _box.get(_keyLanguageCode);

  /*
  * Add to hive
  */
  Future<void> setTokenValue(String tokenValue) => _box.put(_keyTokenValue, tokenValue);

  Future<void> setUserData(User? value) => _box.put(_keyProfile, value);

  Future<void> setIdsReadNowGuest(List<String> value) => _box.put(_keyIdsReadNowGuest, value);

  List<String> getIdsReadNowGuest() => _box.get(_keyIdsReadNowGuest) ?? [];

  Stream<List<String>> watchIdsReadNowGuest() {
    return _box.watch(key: _keyIdsReadNowGuest).transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          final value = data.value;
          sink.add(value is List<String> ? value : []);
        },
      ),
    );
  }

  /*
  * Get from hive
  */
  String? getTokenValue() => _box.get(_keyTokenValue);

  Stream<String?> watchTokenValue() {
    return _box.watch(key: _keyTokenValue).transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          final value = data.value;
          sink.add(value is String ? value : null);
        },
      ),
    );
  }

  Future<void> setNovelTextSize(double size) => _box.put(_keyNovelTextSize, size);

  double getNovelTextSize() => _box.get(_keyNovelTextSize) ?? 15;

  Future<void> setNovelBackground(int color) => _box.put(_keyNovelBackground, color);

  Color getNovelBackground() => Color(_box.get(_keyNovelBackground) ?? 0xFFFFFF);

  Future<void> setNovelTextFamily(String? fontFamily) => _box.put(_keyNovelFontFamily, fontFamily);

  FontFamily getNovelTextFamily() => getFontFamily(_box.get(_keyNovelFontFamily));

  Future<int> clear() => _box.clear();
}
