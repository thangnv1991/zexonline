import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zexonline/src/extensions/string_extensions.dart';
import 'package:zexonline/src/utils/app_shared.dart';

class AppUtils {
  /// Check is debug mode
  static bool isDebugMode() {
    if (kReleaseMode) {
      return false;
    } else {
      return true;
    }
  }

  static String formatUtcTime(
      {required String? dateUtc,
      String? format = 'dd/MM/yyyy HH:mm:ss',
      String languageCode = 'en'}) {
    try {
      if (dateUtc == null) return "";

      String date = dateUtc;
      if (!date.contains("Z")) {
        date = "${date}Z";
      }
      var dateLocal = DateTime.parse(date).toLocal();
      return DateFormat(format).format(dateLocal);
    } catch (e) {
      return '-:--';
    }
  }

  static String formatNumber(int number) {
    if (number < 1000) {
      return number.toString();
    } else if (number < 10000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    } else {
      return '${(number / 1000).round()}k';
    }
  }

  static bool isLogin() {
    String? tokenValue = Get.find<AppShared>().getTokenValue();

    return !(tokenValue).isNullOrEmpty();
  }
}
