import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/library/interactor/library_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_gridview.dart';
import 'package:zexonline/src/ui/widgets/manga_item/manga_grid_full_item.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class LibraryMangaGridView extends StatelessWidget {
  const LibraryMangaGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(builder: (context, state) {
      return CustomGridView(
        itemCount: state.stories.length,
        isLoading: state.isLoading,
        itemRatio: 0.5,
        itemBuilder: (context, index, heightItem) {
          return MangaGridFullItem(
            story: state.stories[index],
            onNavigateToDetail: () => Get.find<LibraryBloc>().add(OnNavigatePage(
                PageCommandNavigatorPage(page: AppPages.storyDetail(state.stories[index].id!)))),
          );
        },
      );
    });
  }
}
