import 'package:zexonline/src/ui/routing/pop_result.dart';
import 'package:zexonline/src/utils/app_pages.dart';
import 'package:get/get.dart';

class NavigatorManager {
  String pagePrevious = AppPages.main;

  final List<String> _pageStack = [];

  /// Use to navigation to page with [args] is param
  Future<PopResult> navigateToPage(String page, {dynamic args}) async {
    if (pagePrevious != page) {
      pagePrevious = page;
    }

    _pageStack.add(page);

    final result = await Get.toNamed(page, arguments: args);

    return result is PopResult ? result : PopResult(status: false, resultFromPage: "");
  }

  Future<void> offToPage(String page, {dynamic args}) async {
    try {
      _pageStack.removeLast();
      _pageStack.add(page);

      Get.offNamed(page, arguments: args);
    } catch (ex) {
      // FirebaseCrashlytics.instance.recordError(ex, StackTrace.empty);
    }
  }

  /// Use when want pop back page previous with PopResult is data return
  Future<void> popBack({PopResult? popResult, bool isDialog = false}) async {
    try {
      if (_pageStack.isNotEmpty && !isDialog) _pageStack.removeLast();

      Get.back(result: popResult);
    } catch (ex) {
      // FirebaseCrashlytics.instance.recordError(ex, StackTrace.empty);
    }
  }

  Future<void> offNamedUntil(String page) async {
    try {
      if (pagePrevious != page) {
        pagePrevious = page;
      }

      _pageStack.clear();
      _pageStack.add(page);

      Get.offNamedUntil(page, (route) => false);
    } catch (ex) {
      // FirebaseCrashlytics.instance.recordError(ex, StackTrace.empty);
    }
  }

  Future<void> popUntil({required String page, PopResult? popResult}) async {
    try {
      if (page.isNotEmpty && _pageStack.isNotEmpty) {
        final pageStackClone = _pageStack;
        for (int i = pageStackClone.length - 1; i >= 0; i--) {
          if (_pageStack[i] == page) {
            break;
          }
          _pageStack.removeLast();

          Get.back(result: popResult);
        }
      }
    } catch (ex) {
      // FirebaseCrashlytics.instance.recordError(ex, StackTrace.empty);
    }
  }
}
