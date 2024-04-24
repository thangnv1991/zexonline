import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/enums/enum_bottom_navigation_page.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/home/component/home_appbar.dart';
import 'package:zexonline/src/ui/home/component/manga_gridview_section.dart';
import 'package:zexonline/src/ui/home/component/manga_listview_section.dart';
import 'package:zexonline/src/ui/home/interactor/home_bloc.dart';
import 'package:zexonline/src/ui/main/components/app_bottom_navigationbar.dart';
import 'package:zexonline/src/ui/main/interactor/main_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const HomeAppBar(),
        body: ListView(
          padding: 0.paddingAll,
          children: [
            16.height,
            const MangaListViewSection(),
            16.height,
            BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) => previous.latestUpdate != current.latestUpdate,
                builder: (context, state) {
                  return MangaGridViewSection(
                    LocaleKey.latestUpdateHome.tr,
                    stories: state.latestUpdate,
                  );
                }),
            16.height,
            BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) => previous.nowReading != current.nowReading,
                builder: (context, state) {
                  return state.nowReading.isNotEmpty
                      ? MangaGridViewSection(
                          LocaleKey.nowReading.tr,
                          stories: state.nowReading,
                        )
                      : Center(
                          child: TextButton(
                            onPressed: () {
                              Get.find<MainBloc>()
                                  .add(const OnChangeTabEvent(BottomNavigationPage.Discover));
                            },
                            child: Text(
                              LocaleKey.noDataReadNow.tr,
                              style: GoogleFonts.cabin(
                                fontSize: 13,
                                color: AppColors.white,
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
    );
  }
}
