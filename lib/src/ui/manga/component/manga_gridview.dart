import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/ui/manga/interactor/manga_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_circular_progress.dart';
import 'package:zexonline/src/ui/widgets/common/custom_gridview.dart';
import 'package:zexonline/src/ui/widgets/manga_item/manga_grid_short_item.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class MangaGridView extends StatelessWidget {
  const MangaGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MangaBloc>();
    return BlocBuilder<MangaBloc, MangaState>(
        buildWhen: (previous, current) =>
            previous.selectedType != current.selectedType ||
            previous.status != current.status ||
            previous.novelsByGenre != current.novelsByGenre,
        builder: (context, state) {
          final selectedType = state.selectedType;
          return state.status == PageState.loading
              ? const Center(child: CustomCircularProgress(color: AppColors.white))
              : BlocBuilder<MangaBloc, MangaState>(
                  buildWhen: (previous, current) =>
                      previous.novelsByGenre[selectedType] != current.novelsByGenre[selectedType] ||
                      previous.isLoadMore != current.isLoadMore,
                  builder: (context, state) {
                    final List<StoryModel> stories = state.novelsByGenre[selectedType] ?? [];
                    return CustomGridView(
                      itemCount: stories.length,
                      scrollPhysics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index, _) {
                        final story = stories[index];

                        return MangaGridShortItem(
                          story: story, onNavigateToDetail: () {},

                          // onNavigateToDetail: () => bloc.add(OnNavigatePage(
                          //     PageCommandNavigatorPage(
                          //         page: AppPages.storyDetail(story.id ?? '')))),
                        );
                      },
                      isLoadMore: state.isLoadMore,
                      // loadMore: () => bloc.add(GetNovelsByGenre(state.selectedType)),
                      // refresh: () => bloc.add(GetNovelsByGenre(state.selectedType, page: 1)),
                    );
                  });
        });
  }
}
