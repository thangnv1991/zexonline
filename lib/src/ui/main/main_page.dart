import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/enums/enum_bottom_navigation_page.dart';
import 'package:zexonline/src/ui/discover/binding/discover_binding.dart';
import 'package:zexonline/src/ui/discover/discover_page.dart';
import 'package:zexonline/src/ui/home/binding/home_binding.dart';
import 'package:zexonline/src/ui/home/home_page.dart';
import 'package:zexonline/src/ui/library/binding/library_binding.dart';
import 'package:zexonline/src/ui/library/library_page.dart';
import 'package:zexonline/src/ui/main/components/app_bottom_navigationbar.dart';
import 'package:zexonline/src/ui/main/interactor/main_bloc.dart';
import 'package:zexonline/src/ui/novel/binding/novel_binding.dart';
import 'package:zexonline/src/ui/novel/novel_page.dart';
import 'package:zexonline/src/ui/options/binding/options_binding.dart';
import 'package:zexonline/src/ui/options/options_page.dart';
import 'package:zexonline/src/utils/app_colors.dart';

Map<BottomNavigationPage, Widget> pages = {};

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<MainBloc>()..add(const GetGenres()),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.transparent,
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: BlocBuilder<MainBloc, MainState>(
              buildWhen: (previous, current) => previous.currentPage != current.currentPage,
              builder: (context, state) {
                _createPage(state.currentPage);
                return IndexedStack(
                  sizing: StackFit.expand,
                  index: pages.keys.toList().indexOf(state.currentPage),
                  children: pages.values.toList(),
                );
              },
            ),
            bottomNavigationBar: const AppBottomNavigationBar(),
          );
        },
      ),
    );
  }

  _createPage(BottomNavigationPage currentPage) {
    switch (currentPage) {
      case BottomNavigationPage.Home:
        HomeBinding().dependencies();
        return pages.putIfAbsent(currentPage, () => const HomePage());
      case BottomNavigationPage.Novel:
        NovelBinding().dependencies();
        return pages.putIfAbsent(currentPage, () => const NovelPage());
      case BottomNavigationPage.Discover:
        DiscoverBinding().dependencies();
        return pages.putIfAbsent(currentPage, () => const DiscoverPage());
      case BottomNavigationPage.Library:
        LibraryBinding().dependencies();
        return pages.putIfAbsent(currentPage, () => const LibraryPage());
      case BottomNavigationPage.Options:
        OptionsBinding().dependencies();
        return pages.putIfAbsent(currentPage, () => const OptionsPage());
    }
  }
}
