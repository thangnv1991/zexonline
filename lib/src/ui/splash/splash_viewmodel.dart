import 'package:zexonline/src/ui/base/base_viewmodel.dart';
import 'package:zexonline/src/utils/app_pages.dart';
import 'package:get/get.dart';

class SplashViewModel extends BaseViewModel {
  @override
  onInit() {
    super.onInit();
    fetchLogin();
  }

  fetchLogin() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offNamedUntil(AppPages.main, (route) => false),
    );
  }
}
