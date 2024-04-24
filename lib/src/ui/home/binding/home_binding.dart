import 'package:get/get.dart';
import 'package:zexonline/src/ui/home/interactor/home_bloc.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeBloc>(HomeBloc());
  }
}
