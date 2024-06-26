import 'package:zexonline/src/utils/app_assets.dart';

enum BottomNavigationPage {
  Home,
  Manga,
  Novel,
  Library,
  Options;

  String get nameTab {
    switch (this) {
      case BottomNavigationPage.Home:
        return "Trang chủ";
      case BottomNavigationPage.Novel:
        return "Tiểu thuyết";
      case BottomNavigationPage.Manga:
        return "Manga";
      case BottomNavigationPage.Library:
        return "Thư viện";
      case BottomNavigationPage.Options:
        return "Cài đặt";
    }
  }

  String get activeIcon {
    switch (this) {
      case BottomNavigationPage.Home:
        return AppAssets.ic_home_svg;
      case BottomNavigationPage.Novel:
        return AppAssets.ic_novel_svg;
      case BottomNavigationPage.Manga:
        return AppAssets.ic_discover_svg;
      case BottomNavigationPage.Library:
        return AppAssets.ic_library_svg;
      case BottomNavigationPage.Options:
        return AppAssets.ic_options_svg;
    }
  }
}
