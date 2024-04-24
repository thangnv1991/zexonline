import 'package:get/get.dart';
import 'package:zexonline/src/ui/auth/interactor/auth_bloc.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthBloc>(AuthBloc());
  }
}
