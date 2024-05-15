import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/discover/component/top_navigate_item.dart';
import 'package:zexonline/src/ui/novel/component/novel_gridview.dart';
import 'package:zexonline/src/ui/novel/interactor/novel_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class NovelPage extends StatelessWidget {
  const NovelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<NovelBloc>()..add(const GetNovels()),
      child: BlocConsumer<NovelBloc, NovelState>(
        listener: (context, state) {
          if (state.pageCommand is PageCommandNavigatorPage) {
            onNavigate(state.pageCommand as PageCommandNavigatorPage);
          }

          Get.find<NovelBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          return BasePage(
            isBackground: false,
            child: Scaffold(
              backgroundColor: AppColors.white,
              body: Column(
                children: [
                  26.height,
                  SizedBox(
                    height: 50,
                    child: DefaultTabController(
                      length: 2,
                      child: TabBar(
                          isScrollable: false,
                          tabAlignment: TabAlignment.center,
                          automaticIndicatorColorAdjustment: false,
                          indicator: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: 10.borderRadiusAll,
                          ),
                          tabs: [
                            TopNavigateItem(0,
                                title: LocaleKey.novel.tr,
                                selectedTab: state.selectedTab,
                                onClick: () => Get.find<NovelBloc>().add(const OnChangeType(0))),
                            TopNavigateItem(1,
                                title: LocaleKey.audio.tr,
                                selectedTab: state.selectedTab,
                                onClick: () => Get.find<NovelBloc>().add(const OnChangeType(1))),
                          ]),
                    ),
                  ),
                  10.height,
                  const Expanded(
                    child: NovelGridView(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void onNavigate(PageCommandNavigatorPage page) async {
  Get.find<NavigatorManager>().navigateToPage(page.page, args: page.argument);
}
