import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/enums/enum_bottom_navigation_page.dart';
import 'package:zexonline/src/enums/enum_sort_type.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/home/component/manga_gridview_section.dart';
import 'package:zexonline/src/ui/home/component/manga_listview_section.dart';
import 'package:zexonline/src/ui/home/interactor/home_bloc.dart';
import 'package:zexonline/src/ui/main/components/app_bottom_navigationbar.dart';
import 'package:zexonline/src/ui/main/interactor/main_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      isBackground: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: ListView(
            padding: 0.paddingAll,
            children: [
              24.height,
              const MangaListViewSection(),
              16.height,
              BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) => previous.latestUpdate != current.latestUpdate,
                  builder: (context, state) {
                    return MangaGridViewSection(
                      LocaleKey.latestUpdateHome.tr,
                      stories: state.latestUpdate,
                      isLoading: state.loadingLatestUpdate,
                      onTapSeeMore: () => Get.find<NavigatorManager>()
                          .navigateToPage(AppPages.moreStory, args: SortType.LatestUpdate),
                    );
                  }),
              16.height,
              BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) => previous.nowReading != current.nowReading,
                  builder: (context, state) {
                    return state.loadingNowReading || state.nowReading.isNotEmpty
                        ? MangaGridViewSection(
                            LocaleKey.nowReading.tr,
                            stories: state.nowReading,
                            isLoading: state.loadingNowReading,
                          )
                        : Center(
                            child: TextButton(
                              onPressed: () {
                                Get.find<MainBloc>()
                                    .add(const OnChangeTabEvent(BottomNavigationPage.Manga));
                              },
                              child: Text(
                                LocaleKey.noDataReadNow.tr,
                                style: GoogleFonts.cabin(
                                  fontSize: 13,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                  }),
              bottomHeight.toInt().height,
            ],
          ),
        ),
      ),
    );
  }
}
