import 'package:get/get.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';

class StoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StoryBloc>(StoryBloc());
  }
}
