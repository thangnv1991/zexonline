import 'package:get/get.dart';
import 'package:zexonline/src/locale/locale_key.dart';

enum SortType {
  OldestToLatest,
  LatestToOldest,
  OldestUpdate,
  LatestUpdate,
  Views,
  Rate,
  Popular,
  NewChapter;

  String get name {
    switch (this) {
      case SortType.LatestUpdate:
        return LocaleKey.latestUpdateHome.tr;
      case SortType.Views:
        return LocaleKey.views.tr;
      case SortType.Rate:
        return LocaleKey.rate.tr;
      case SortType.NewChapter:
        return LocaleKey.newChapter.tr;
      default:
        return '';
    }
  }

  String get api {
    switch (this) {
      case SortType.LatestToOldest:
        return 'oldest';
      case SortType.OldestToLatest:
        return 'latest';
      case SortType.Views:
        return 'views';
      case SortType.Rate:
        return 'rate';
      case SortType.Popular:
        return 'popular';
      case SortType.LatestUpdate:
        return 'latest_update';
      case SortType.OldestUpdate:
        return 'oldest_update';
      case SortType.NewChapter:
        return 'new_chapter';
    }
  }
}
