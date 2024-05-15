import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/ui/novel/interactor/novel_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_circular_progress.dart';
import 'package:zexonline/src/ui/widgets/common/custom_gridview.dart';
import 'package:zexonline/src/ui/widgets/manga_item/manga_grid_short_item.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class NovelGridView extends StatelessWidget {
  const NovelGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NovelBloc>();
    return BlocBuilder<NovelBloc, NovelState>(
        buildWhen: (previous, current) =>
            previous.selectedTab != current.selectedTab || previous.status != current.status,
        builder: (context, state) {
          return state.status == PageState.loading
              ? const Center(child: CustomCircularProgress(color: AppColors.black))
              : BlocBuilder<NovelBloc, NovelState>(builder: (context, state) {
                  final List<StoryModel> stories = state.novels;
                  return CustomGridView(
                    itemCount: stories.length,
                    scrollPhysics: const AlwaysScrollableScrollPhysics(),
                    itemRatio: 1.5,
                    itemBuilder: (context, index, _) {
                      final story = stories[index];

                      return MangaGridShortItem(
                        story: story,
                        onNavigateToDetail: () => bloc.add(OnNavigatePage(
                            PageCommandNavigatorPage(page: AppPages.storyDetail(story.id ?? '')))),
                      );
                    },
                    isLoadMore: state.isLoadMore,
                    loadMore: () =>
                        bloc.add(GetNovels(page: state.meta?.page ?? 1, isLoadMore: true)),
                    refresh: () => bloc.add(const GetNovels(page: 1)),
                  );
                });
        });
  }
}
