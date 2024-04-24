import 'package:get/get.dart';
import 'package:zexonline/src/ui/library/interactor/library_bloc.dart';

class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LibraryBloc>(LibraryBloc());
  }
}
