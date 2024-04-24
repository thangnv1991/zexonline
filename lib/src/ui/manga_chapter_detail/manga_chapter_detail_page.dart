import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/ui/manga_chapter_detail/component/manga_chapter_detail_view.dart';
import 'package:zexonline/src/ui/manga_chapter_detail/interactor/manga_chapter_detail_bloc.dart';

class MangaChapterDetailPage extends StatelessWidget {
  const MangaChapterDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'];
    return BlocProvider(
      create: (context) => Get.find<MangaChapterDetailBloc>()..add(FetchChapterDetail(id)),
      child: BlocConsumer<MangaChapterDetailBloc, MangaChapterDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          return const ChapterDetailView();
        },
      ),
    );
  }
}
