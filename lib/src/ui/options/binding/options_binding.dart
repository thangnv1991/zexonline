import 'package:get/get.dart';
import 'package:zexonline/src/ui/options/interactor/options_bloc.dart';

class OptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OptionsBloc>(OptionsBloc());
  }
}
