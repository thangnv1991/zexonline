import 'package:get/get.dart';
import 'package:zexonline/src/ui/app_webview/interactor/app_webview_bloc.dart';

class AppWebViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppWebViewBloc>(AppWebViewBloc());
  }
}
