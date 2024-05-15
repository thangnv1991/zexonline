import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/home/component/home_section_common_widget.dart';
import 'package:zexonline/src/ui/home/interactor/home_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_gridview.dart';
import 'package:zexonline/src/ui/widgets/manga_item/manga_grid_short_item.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class MangaGridViewSection extends StatelessWidget {
  final String title;
  final List<StoryModel> stories;
  final VoidCallback? onTapSeeMore;
  final bool isLoading;

  const MangaGridViewSection(
    this.title, {
    super.key,
    this.stories = const [],
    this.onTapSeeMore,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return HomeSectionCommonWidget(
      title,
      onTapSeeMore: onTapSeeMore,
      child: CustomGridView(
        itemCount: stories.length,
        isLoading: isLoading,
        itemBuilder: (context, index, heightItem) {
          final item = stories[index];

          return MangaGridShortItem(
            story: item,
            height: heightItem,
            onNavigateToDetail: () => Get.find<HomeBloc>().add(OnNavigatePage(
                PageCommandNavigatorPage(page: AppPages.storyDetail(item.id ?? '')))),
          );
        },
      ),
    );
  }
}
