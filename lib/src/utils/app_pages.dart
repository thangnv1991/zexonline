import 'package:get/get.dart';
import 'package:zexonline/src/enums/enum_webview_type.dart';
import 'package:zexonline/src/ui/app_webview/app_webview_page.dart';
import 'package:zexonline/src/ui/app_webview/binding/app_webview_binding.dart';
import 'package:zexonline/src/ui/auth/binding/auth_binding.dart';
import 'package:zexonline/src/ui/auth/signin/signin_page.dart';
import 'package:zexonline/src/ui/auth/signup/signup_page.dart';
import 'package:zexonline/src/ui/discover/binding/discover_binding.dart';
import 'package:zexonline/src/ui/discover/discover_page.dart';
import 'package:zexonline/src/ui/main/binding/main_binding.dart';
import 'package:zexonline/src/ui/main/main_page.dart';
import 'package:zexonline/src/ui/manga_chapter_detail/binding/manga_chapter_detail_binding.dart';
import 'package:zexonline/src/ui/manga_chapter_detail/manga_chapter_detail_page.dart';
import 'package:zexonline/src/ui/more_story/binding/more_story_binding.dart';
import 'package:zexonline/src/ui/more_story/more_story_page.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/binding/novel_chapter_detail_binding.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/novel_chapter_detail_page.dart';
import 'package:zexonline/src/ui/payment/binding/payment_binding.dart';
import 'package:zexonline/src/ui/payment/payment_page.dart';
import 'package:zexonline/src/ui/splash/binding/splash_binding.dart';
import 'package:zexonline/src/ui/splash/splash_page.dart';
import 'package:zexonline/src/ui/story_detail/binding/story_detail_binding.dart';
import 'package:zexonline/src/ui/story_detail/story_detail_page.dart';

class AppPages {
  static const String splash = _Paths.splash;
  static const String main = _Paths.main;
  static const String payment = _Paths.payment;
  static const String signIn = _Paths.signIn;
  static const String signUp = _Paths.signUp;
  static const String moreStory = _Paths.moreStory;

  //Root
  static const String storyDetailRoot = '/story-detail';
  static const String mangaChapterDetailRoot = '/manga-detail';
  static const String novelChapterDetailRoot = '/novel-detail';
  static const String webViewRoot = '/web-view';

  static const String discover = '/discover';

  static String storyDetail(String id) => '$storyDetailRoot/$id';

  static String mangaChapterDetail(String id) => '$mangaChapterDetailRoot/$id';

  static String novelChapterDetail(String id) => '$novelChapterDetailRoot/$id';

  static String webView(WebViewType type) => '$webViewRoot/${type.name}';

  static final pages = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.payment,
      page: () => const PaymentPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.storyDetail,
      page: () => const StoryDetailPage(),
      binding: StoryDetailBinding(),
    ),
    GetPage(
      name: _Paths.mangaChapterDetail,
      page: () => const MangaChapterDetailPage(),
      binding: MangaChapterDetailBinding(),
    ),
    GetPage(
      name: _Paths.novelChapterDetail,
      page: () => const NovelChapterDetailPage(),
      binding: NovelChapterDetailBinding(),
    ),
    GetPage(
      name: _Paths.signIn,
      page: () => const SignInPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.signUp,
      page: () => const SignUpPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.webView,
      page: () => const AppWebViewPage(),
      binding: AppWebViewBinding(),
    ),
    GetPage(
      name: _Paths.discover,
      page: () => const DiscoverPage(),
      binding: DiscoverBinding(),
    ),
    GetPage(
      name: _Paths.moreStory,
      page: () => const MoreStoryPage(),
      binding: MoreStoryBinding(),
    ),
  ];
}

abstract class _Paths {
  static const String splash = "/splash";
  static const String main = "/main";
  static const String payment = "/payment";
  static const String signIn = "/sign_in";
  static const String signUp = "/sign_up";
  static const String discover = '/discover';
  static const String moreStory = '/more-story';
  static const String storyDetail = "${AppPages.storyDetailRoot}/:id";
  static const String mangaChapterDetail = "${AppPages.mangaChapterDetailRoot}/:id";
  static const String novelChapterDetail = "${AppPages.novelChapterDetailRoot}/:id";
  static const String webView = "${AppPages.webViewRoot}/:type";
}
