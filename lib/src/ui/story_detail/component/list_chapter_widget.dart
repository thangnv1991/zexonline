import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zexonline/src/ui/story_detail/component/chapters_view/chapters_grid_view.dart';
import 'package:zexonline/src/ui/story_detail/component/chapters_view/chapters_list_view.dart';
import 'package:zexonline/src/ui/story_detail/component/header_list_chapter_widget.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_no_data_widget.dart';

class ListChapterWidget extends StatelessWidget {
  const ListChapterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderListChapterWidget(),
        BlocBuilder<StoryBloc, StoryDetailState>(
            buildWhen: (previous, current) =>
                previous.chapters != current.chapters ||
                previous.gridView != current.gridView ||
                previous.story != current.story,
            builder: (context, state) {
              final chapters = state.chapters;
              final storyType = state.story?.storyType();
              return Expanded(
                child: chapters.isEmpty
                    ? const CustomNoDataWidget()
                    : Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: state.gridView
                            ? ChaptersGridView(state.chapters, storyType, state.story!.id!)
                            : ChaptersListView(state.chapters, storyType, state.story!.id!),
                      ),
              );
            })
      ],
    );
  }
}
