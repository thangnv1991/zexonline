import 'package:zexonline/src/ui/splash/splash_viewmodel.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashViewModel>(SplashViewModel());
  }
}
