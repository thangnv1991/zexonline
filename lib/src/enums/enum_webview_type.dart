import 'package:zexonline/src/utils/app_constants.dart';

enum WebViewType {
  AboutUs,
  Term,
  Privacy;

  String getUrl() {
    switch (this) {
      case WebViewType.AboutUs:
        return AppConstants.aboutUsUrl;
      case WebViewType.Term:
        return AppConstants.termUrl;
      case WebViewType.Privacy:
        return AppConstants.privacyUrl;
    }
  }
}

WebViewType? getWebViewType(String value) {
  switch (value) {
    case 'AboutUs':
      return WebViewType.AboutUs;
    case 'Term':
      return WebViewType.Term;
    case 'Privacy':
      return WebViewType.Privacy;
    default:
      return null;
  }
}
