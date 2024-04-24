import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/library/interactor/library_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_no_data_widget.dart';
import 'package:zexonline/src/ui/widgets/manga_item/manga_grid_full_item.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class LibraryMangaGridView extends StatelessWidget {
  const LibraryMangaGridView({super.key});

  @override
  Widget build(BuildContext context) {
    const crossAxisCount = 3;
    const double axisSpacing = 6;
    const itemRatio = 0.55;
    return BlocBuilder<LibraryBloc, LibraryState>(builder: (context, state) {
      return state.stories.isNotEmpty
          ? GridView.builder(
              padding: const EdgeInsets.fromLTRB(6, 0, 6, 80),
              itemCount: state.stories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: axisSpacing,
                crossAxisSpacing: axisSpacing,
                childAspectRatio: itemRatio,
              ),
              itemBuilder: (context, index) {
                return MangaGridFullItem(
                  story: state.stories[index],
                  onNavigateToDetail: () => Get.find<LibraryBloc>().add(OnNavigatePage(
                      PageCommandNavigatorPage(
                          page: AppPages.storyDetail(state.stories[index].id!)))),
                );
              },
            )
          : const Padding(
              padding: EdgeInsets.only(bottom: 150.0),
              child: CustomNoDataWidget(),
            );
    });
  }
}
