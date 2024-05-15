import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/enums/enum_sort_type.dart';
import 'package:zexonline/src/enums/enum_story_type.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/manga/interactor/manga_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/ui/widgets/common_grid_view.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class MangaPage extends StatelessWidget {
  const MangaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<MangaBloc>()
        ..add(const GetListStories(SortType.NewChapter))
        ..add(const GetListStories(SortType.LatestUpdate))
        ..add(const GetListStories(SortType.Popular))
        ..add(const GetListStories(SortType.Rate)),
      child: BlocConsumer<MangaBloc, MangaState>(
        listener: (context, state) {
          Get.find<MangaBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          return BasePage(
            isBackground: false,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: CustomAppBar(title: LocaleKey.manga.tr, implyLeading: false, actions: [
                IconButton(
                  onPressed: () => Get.find<NavigatorManager>().navigateToPage(AppPages.discover),
                  icon: Container(
                      padding: 3.paddingAll,
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.search,
                        color: AppColors.primary,
                      )),
                )
              ]),
              body: RefreshIndicator(
                onRefresh: () async {
                  Get.find<MangaBloc>()
                    ..add(const GetListStories(SortType.NewChapter))
                    ..add(const GetListStories(SortType.LatestUpdate))
                    ..add(const GetListStories(SortType.Popular))
                    ..add(const GetListStories(SortType.Rate));
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CommonGridView(
                        type: SortType.NewChapter,
                        storyType: StoryType.Comic,
                        data: state.storiesNewChapter,
                        isLoading: state.loadingNewChapter,
                      ),
                      CommonGridView(
                        type: SortType.LatestUpdate,
                        storyType: StoryType.Comic,
                        data: state.storiesLatestUpdate,
                        isLoading: state.loadingLatestUpdate,
                      ),
                      CommonGridView(
                        type: SortType.Rate,
                        storyType: StoryType.Comic,
                        data: state.storiesRate,
                        isLoading: state.loadingPopular,
                      ),
                      10.height,
                      CommonGridView(
                        type: SortType.Popular,
                        storyType: StoryType.Comic,
                        data: state.storiesPopular,
                        isLoading: state.loadingRate,
                      ),
                      85.height,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
