import 'package:get/get.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/interactor/novel_chapter_detail_bloc.dart';

class NovelChapterDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NovelChapterDetailBloc>(NovelChapterDetailBloc());
  }
}
