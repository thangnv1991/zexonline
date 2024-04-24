import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/discover/interactor/discover_bloc.dart';
import 'package:zexonline/src/ui/widgets/base/app_body.dart';
import 'package:zexonline/src/ui/widgets/common/custom_gridview.dart';
import 'package:zexonline/src/ui/widgets/manga_item/manga_horizontal_item.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class DiscoverMangaGridViewSection extends StatelessWidget {
  const DiscoverMangaGridViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.stories != current.stories ||
          previous.isLoadMore != current.isLoadMore,
      builder: (context, state) {
        final itemCount = state.stories.length;
        return AppBody(
          pageState: state.status,
          success: CustomGridView(
            isLoadMore: state.isLoadMore,
            spaceHorizontal: 6,
            crossAxisCount: 4,
            itemCount: itemCount,
            itemRatio: 0.75,
            itemBuilder: (context, index, _) {
              final story = state.stories[index];
              return MangaHorizontalItem(
                story: story,
                isTop: false,
                onNavigateToDetail: () => Get.find<DiscoverBloc>().add(
                  OnNavigatePage(
                    PageCommandNavigatorPage(
                      page: AppPages.storyDetail(story.id ?? ''),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
