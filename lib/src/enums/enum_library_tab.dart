import 'package:get/get.dart';
import 'package:zexonline/src/locale/locale_key.dart';

enum LibraryTab {
  History,
  Favorite,
  Download;

  String get tabName {
    switch (this) {
      case LibraryTab.Download:
        return LocaleKey.download.tr;
      case LibraryTab.Favorite:
        return LocaleKey.favorite.tr;
      case LibraryTab.History:
        return LocaleKey.history.tr;
    }
  }
}
