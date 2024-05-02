import 'package:get/get.dart';
import 'package:zexonline/src/ui/more_story/interactor/more_story_bloc.dart';

class MoreStoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MoreStoryBloc>(MoreStoryBloc());
  }
}
