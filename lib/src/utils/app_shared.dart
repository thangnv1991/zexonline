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

  final String keyFcmToken = "${keyName}_keyFCMToken";
  final String keyTokenValue = "${keyName}_keyTokenValue";
  final String keyProfile = "${keyName}_keyProfile";
  final String keyIdsReadNowGuest = "${keyName}_keyIdsReadNowGuest";
  final String keyCountNotify = "${keyName}_keyCountNotify";
  final String keyLanguageCode = "${keyName}_keyLanguageCode";
  final String keyGenres = "${keyName}_keyGenres";
  final String keyNovelBackground = "${keyName}_keyNovelBackground";
  final String keyNovelTextSize = "${keyName}_keyNovelTextSize";
  final String keyNovelFontFamily = "${keyName}_keyNovelFontFamily";

  final Box<dynamic> _box;

  AppShared(this._box);

  Box getBox() => _box;

  Future<void> setTokenFcm(String firebaseToken) async {
    _box.put(keyFcmToken, firebaseToken);
  }

  String? getTokenFcm() => _box.get(keyFcmToken);

  /*
  * Save Selected Locale
  */
  Future<void> setLanguageCode(String languageCode) => _box.put(keyLanguageCode, languageCode);

  /*
  * Get Selected Locale
  */
  String? getLanguageCode() => _box.get(keyLanguageCode);

  /*
  * Add to hive
  */
  Future<void> setTokenValue(String tokenValue) => _box.put(keyTokenValue, tokenValue);

  Future<void> setUserData(User? value) => _box.put(keyProfile, value);

  Future<void> setIdsReadNowGuest(List<String> value) => _box.put(keyIdsReadNowGuest, value);

  List<String> getIdsReadNowGuest() => _box.get(keyIdsReadNowGuest) ?? [];

  Stream<List<String>> watchIdsReadNowGuest() {
    return _box.watch(key: keyIdsReadNowGuest).transform(
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
  String? getTokenValue() => _box.get(keyTokenValue);

  Stream<String?> watchTokenValue() {
    return _box.watch(key: keyTokenValue).transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          final value = data.value;
          sink.add(value is String ? value : null);
        },
      ),
    );
  }

  Future<void> setNovelTextSize(double size) => _box.put(keyNovelTextSize, size);
  double getNovelTextSize() => _box.get(keyNovelTextSize) ?? 15;

  Future<void> setNovelBackground(int color) => _box.put(keyNovelBackground, color);
  Color getNovelBackground() => Color(_box.get(keyNovelBackground) ?? 0xFFFFFF);

  Future<void> setNovelTextFamily(String? fontFamily) => _box.put(keyNovelFontFamily, fontFamily);
  FontFamily getNovelTextFamily() => getFontFamily(_box.get(keyNovelFontFamily));

  Future<int> clear() => _box.clear();
}
