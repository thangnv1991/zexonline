import 'package:zexonline/src/ui/routing/pop_result.dart';
import 'package:get/get.dart';

abstract class BaseViewModel extends GetxController {
  BaseViewModel();

  final RxBool loadingSubject = false.obs;
  final RxBool autoValidationSubject = false.obs;

  void setLoading(bool loading) {
    if (loadingSubject.value == loading) return;
    loadingSubject.value = loading;
  }

  bool get isLoading => loadingSubject.value;

  void setAutoValidation(bool enabled) {
    if (autoValidationSubject.value == enabled) return;
    autoValidationSubject.value = enabled;
  }

  /// Use to navigation to page with [args] is param
  Future<void> navigateToPage(String page, {dynamic args}) async {
    Get.toNamed(page, arguments: args);
  }

  /// Use when want pop back page previous with PopResult is data return
  Future<void> popBack({PopResult? popResult}) async {
    Get.back(result: popResult);
  }

  @override
  void onClose() {
    loadingSubject.close();
    autoValidationSubject.close();
    super.onClose();
  }
}
