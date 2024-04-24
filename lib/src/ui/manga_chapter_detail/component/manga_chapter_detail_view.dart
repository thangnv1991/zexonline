import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/ui/manga_chapter_detail/component/manga_chapter_detail_appbar.dart';
import 'package:zexonline/src/ui/manga_chapter_detail/component/manga_chapter_detail_bottom_action.dart';
import 'package:zexonline/src/ui/manga_chapter_detail/interactor/manga_chapter_detail_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_circular_progress.dart';
import 'package:zexonline/src/ui/widgets/common/custom_no_data_widget.dart';
import 'package:zexonline/src/ui/widgets/common/image_widget.dart';
import 'package:zexonline/src/utils/app_constants.dart';

class ChapterDetailView extends StatelessWidget {
  const ChapterDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      isBackground: false,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: BlocBuilder<MangaChapterDetailBloc, MangaChapterDetailState>(
            buildWhen: (previous, current) =>
                previous.contentPaging != current.contentPaging ||
                previous.status != current.status,
            builder: (context, state) {
              final content = state.contentPaging;
              if (state.status == PageState.loading) {
                return const CustomCircularProgress(
                  color: Colors.white,
                );
              }
              return Scaffold(
                // backgroundColor: AppColors.secondary1,
                body: NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return [const MangaChapterDetailAppBar()];
                  },
                  body: content.isEmpty
                      ? const CustomNoDataWidget()
                      : SafeArea(
                          child: NotificationListener(
                            onNotification: (ScrollNotification scrollNotification) {
                              if (scrollNotification.metrics.pixels >=
                                  scrollNotification.metrics.maxScrollExtent / 2) {
                                Get.find<MangaChapterDetailBloc>()
                                    .add(const FetchMoreChapterDetail());
                              }
                              return true;
                            },
                            child: ListView.builder(
                                itemCount: content.length,
                                cacheExtent: 5 * Get.height,
                                padding: 16.paddingVertical,
                                itemBuilder: (context, index) {
                                  return ImageWidget(
                                      image: content[index].contains("http")
                                          ? content[index]
                                          : AppConstants.domainImage(content[index]));
                                }),
                          ),
                        ),
                ),
                bottomNavigationBar: MangaChapterDetailBottomAction(
                    chapterPrevious: state.chapter?.chapterPrevious,
                    chapterNext: state.chapter?.chapterNext),
              );
            }),
      ),
    );
  }
}
