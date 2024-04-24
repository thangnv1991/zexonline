import 'package:get/get.dart';
import 'package:zexonline/src/ui/discover/interactor/discover_bloc.dart';

class DiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DiscoverBloc>(DiscoverBloc());
  }
}
