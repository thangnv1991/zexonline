import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/enums/enum_sheet_type.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/discover/component/bottom_sheet/category_bottom_sheet.dart';
import 'package:zexonline/src/ui/discover/component/bottom_sheet/sort_by_bottom_sheet.dart';
import 'package:zexonline/src/ui/discover/component/top_navigate_item.dart';
import 'package:zexonline/src/ui/discover/interactor/discover_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<DiscoverBloc>()..add(const GetGenres()),
      child: BlocConsumer<DiscoverBloc, DiscoverState>(
        listener: (context, state) {
          if (state.pageCommand is PageCommandShowBottomSheet) {
            onShowBottomSheet(state.pageCommand as PageCommandShowBottomSheet);
          }
          if (state.pageCommand is PageCommandNavigatorPage) {
            onNavigate(state.pageCommand as PageCommandNavigatorPage);
          }

          Get.find<DiscoverBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          final bloc = context.read<DiscoverBloc>();
          return BasePage(
            unFocusWhenTouchOutsideInput: true,
            isBackground: false,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: CustomAppBar(
                implyLeading: true,
                title: LocaleKey.discover.tr,
                backgroundColor: AppColors.white,
              ),
              body: BlocBuilder<DiscoverBloc, DiscoverState>(builder: (context, state) {
                return Column(children: [
                  SizedBox(
                    height: 50,
                    child: DefaultTabController(
                      length: 3,
                      child: TabBar(
                        isScrollable: false,
                        tabAlignment: TabAlignment.fill,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                        automaticIndicatorColorAdjustment: false,
                        indicator: const BoxDecoration(
                          gradient: LinearGradient(
                              stops: [45 / 50, 48 / 50, 50 / 50],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Color(0xFF604BFF),
                                Color(0xFFDA58F7),
                              ]),
                        ),
                        onTap: (index) => bloc.add(OnChangeTab(index)),
                        tabs: List.generate(
                            3, (index) => TopNavigateItem(index, selectedTab: state.selectedTab)),
                      ),
                    ),
                  ),
                  10.height,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            state.genres.length,
                            (index) => TopNavigateItem(index,
                                    title: state.genres[index].name,
                                    selectedTab: state.genreSelected != null
                                        ? state.genres.indexOf(state.genreSelected!)
                                        : 0, onClick: () {
                                  bloc.add(GenresSelectedEvent(state.genres[index]));
                                })),
                      ),
                    ),
                  ),
                  // const Expanded(
                  //   child: DiscoverMangaGridViewSection(),
                  // )
                ]);
                //
                // return NotificationListener(
                //   onNotification: (ScrollNotification scrollNotification) {
                //     if (scrollNotification.metrics.pixels >=
                //         scrollNotification.metrics.maxScrollExtent / 2) {
                //       if (!state.isLoadMore) bloc.add(const OnSearchStories());
                //     }
                //     return true;
                //   },
                //   child: RefreshIndicator(
                //     onRefresh: () async {
                //       bloc.add(const OnSearchStories(page: 1));
                //     },
                //     child: ListView(
                //       padding: 0.paddingAll,
                //       children: [
                //         16.height,
                //         const DiscoverSearchWidget(),
                //         12.height,
                //         const DiscoverActionButtons(),
                //         16.height,
                //         const DiscoverMangaGridViewSection(),
                //         80.height,
                //       ],
                //     ),
                //   ),
                // );
              }),
            ),
          );
        },
      ),
    );
  }
}

void onShowBottomSheet(PageCommandShowBottomSheet page) async {
  final bloc = Get.find<DiscoverBloc>();
  if (Get.isBottomSheetOpen == true) return;
  if (page.sheetType == SheetType.Category) {
    Get.bottomSheet(
      CategoryBottomSheet(
        onSelectedGenre: (genre) => bloc.add(OnSearchStories(genre: genre, page: 1)),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: 30.borderRadiusTop,
      ),
      barrierColor: Colors.black26,
    );
  } else if (page.sheetType == SheetType.SortBy) {
    Get.bottomSheet(
      SortByBottomSheet(
        onSelectedSortType: (sortType) => bloc.add(OnSearchStories(sortType: sortType, page: 1)),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: 30.borderRadiusTop,
      ),
      barrierColor: Colors.black26,
    );
  }
}

void onNavigate(PageCommandNavigatorPage page) async {
  Get.find<NavigatorManager>().navigateToPage(page.page, args: page.argument);
}
