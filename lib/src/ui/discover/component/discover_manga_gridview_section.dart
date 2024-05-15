import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/ui/discover/interactor/discover_bloc.dart';
import 'package:zexonline/src/ui/widgets/base/app_body.dart';
import 'package:zexonline/src/ui/widgets/common/custom_gridview.dart';
import 'package:zexonline/src/ui/widgets/manga_item/manga_grid_short_item.dart';
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
            loadMore: () =>
                Get.find<DiscoverBloc>().add(OnSearchStories(page: state.meta?.page ?? 1)),
            refresh: () => Get.find<DiscoverBloc>().add(const OnSearchStories(page: 1)),
            itemCount: itemCount,
            itemRatio: 1.5,
            itemBuilder: (context, index, heightItem) {
              final story = state.stories[index];
              return MangaGridShortItem(
                story: story,
                height: heightItem,
                onNavigateToDetail: () => Get.find<NavigatorManager>()
                    .navigateToPage(AppPages.storyDetail(story.id ?? '')),
              );
            },
          ),
        );
      },
    );
  }
}
