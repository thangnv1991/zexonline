import 'package:get/get.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/utils/app_assets.dart';

enum OptionAction {
  Notification,
  // Rating,
  AboutUs,
  // ShareApp,
  JoinFacebook,
  TermOfPrivacy,
  // ClearCaches,
  Logout;

  String get name {
    switch (this) {
      case OptionAction.Notification:
        return LocaleKey.notification.tr;
      // case OptionAction.Rating:
      //   return LocaleKey.rating.tr;
      case OptionAction.AboutUs:
        return LocaleKey.aboutUs.tr;
      // case OptionAction.ShareApp:
      //   return LocaleKey.shareApp.tr;
      case OptionAction.JoinFacebook:
        return LocaleKey.joinFacebook.tr;
      case OptionAction.TermOfPrivacy:
        return LocaleKey.termOfPrivacy.tr;
      // case OptionAction.ClearCaches:
      //   return LocaleKey.clearCaches.tr;
      case OptionAction.Logout:
        return LocaleKey.logout.tr;
    }
  }

  String get icon {
    switch (this) {
      case OptionAction.Notification:
        return AppAssets.ic_notification_svg;
      // case OptionAction.Rating:
      //   return AppAssets.ic_like_svg;
      case OptionAction.AboutUs:
        return AppAssets.ic_people_svg;
      // case OptionAction.ShareApp:
      //   return AppAssets.ic_share_svg;
      case OptionAction.JoinFacebook:
        return AppAssets.ic_facebook_svg;
      case OptionAction.TermOfPrivacy:
        return AppAssets.ic_note_svg;
      // case OptionAction.ClearCaches:
      //   return AppAssets.ic_trash_svg;
      case OptionAction.Logout:
        return AppAssets.ic_trash_svg;
    }
  }
}
