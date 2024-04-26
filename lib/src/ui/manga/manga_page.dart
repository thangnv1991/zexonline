import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/manga/component/manga_gridview.dart';
import 'package:zexonline/src/ui/manga/component/novel_top_navigate_item.dart';
import 'package:zexonline/src/ui/manga/interactor/manga_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class MangaPage extends StatelessWidget {
  const MangaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<MangaBloc>()..add(const GetGenres()),
      child: BlocConsumer<MangaBloc, MangaState>(
        listener: (context, state) {
          if (state.pageCommand is PageCommandNavigatorPage) {
            onNavigate(state.pageCommand as PageCommandNavigatorPage);
          }

          Get.find<MangaBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          return BasePage(
            isBackground: false,
            child: Scaffold(
              backgroundColor: AppColors.primary,
              appBar: CustomAppBar(
                title: LocaleKey.manga.tr,
                implyLeading: false,
                  actions: [
                    IconButton(
                      onPressed: () => Get.find<NavigatorManager>().navigateToPage(AppPages.discover),
                      icon: Container(
                          padding: 3.paddingAll,
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: AppColors.secondary2,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.search,
                            color: AppColors.white,
                          )),
                    )
                  ]
              ),
              body: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: BlocBuilder<MangaBloc, MangaState>(
                        buildWhen: (previous, current) => previous.genres != current.genres,
                        builder: (context, state) {
                          return DefaultTabController(
                            length: state.genres.length,
                            child: TabBar(
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
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
                              onTap: (index) =>
                                  Get.find<MangaBloc>().add(OnChangeType(state.genres[index].id)),
                              tabs: List.generate(
                                state.genres.length,
                                    (index) => MangaTopNavigateItem(
                                  state.genres[index],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  10.height,
                  const Expanded(
                    child: MangaGridView(),
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
