import 'package:get/get.dart';
import 'package:zexonline/src/ui/manga/interactor/manga_bloc.dart';

class MangaBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MangaBloc>(MangaBloc());
  }
}
