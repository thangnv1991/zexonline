import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/story_detail/component/story_detail_view.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';

class StoryDetailPage extends StatelessWidget {
  const StoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final storyId = Get.parameters['id'] ?? "";
    return BlocProvider(
      create: (context) => Get.find<StoryBloc>()
        ..add(Init(storyId: storyId))
        ..add(FetchChapterList(storyId: storyId)),
      child: BlocConsumer<StoryBloc, StoryDetailState>(
        listener: (context, state) {
          if (state.pageCommand is PageCommandNavigatorPage) {
            onNavigate(state.pageCommand as PageCommandNavigatorPage);
          }

          Get.find<StoryBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          return const StoryDetailView();
        },
      ),
    );
  }
}

void onNavigate(PageCommandNavigatorPage page) async {
  Get.find<NavigatorManager>().navigateToPage(page.page, args: page.argument);
}
