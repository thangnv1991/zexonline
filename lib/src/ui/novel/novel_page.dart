import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/novel/component/novel_gridview.dart';
import 'package:zexonline/src/ui/novel/component/novel_top_navigate_item.dart';
import 'package:zexonline/src/ui/novel/interactor/novel_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class NovelPage extends StatelessWidget {
  const NovelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<NovelBloc>(),
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
              backgroundColor: AppColors.greyF3,
              body: Column(
                children: [
                  26.height,
                  SizedBox(
                    height: 50,
                    child: BlocBuilder<NovelBloc, NovelState>(
                        buildWhen: (previous, current) => previous.genres != current.genres,
                        builder: (context, state) {
                          return DefaultTabController(
                            length: 2,
                            child: TabBar(
                                isScrollable: false,
                                tabAlignment: TabAlignment.center,
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
                                        ])),
                                onTap: (index) => Get.find<NovelBloc>().add(OnChangeType(index)),
                                tabs: const [NovelTopNavigateItem(1), NovelTopNavigateItem(2)]),
                          );
                        }),
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
