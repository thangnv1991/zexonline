import 'package:get/get.dart';
import 'package:zexonline/src/ui/manga_chapter_detail/interactor/manga_chapter_detail_bloc.dart';

class MangaChapterDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MangaChapterDetailBloc>(MangaChapterDetailBloc());
  }
}
