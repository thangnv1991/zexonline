import 'package:get/get.dart';
import 'package:zexonline/src/ui/novel/interactor/novel_bloc.dart';

class NovelBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NovelBloc>(NovelBloc());
  }
}
