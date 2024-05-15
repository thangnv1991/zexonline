import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/discover/component/discover_manga_gridview_section.dart';
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
                        indicator: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: 10.borderRadiusAll,
                        ),
                        onTap: (index) => bloc.add(OnChangeTab(index)),
                        tabs: List.generate(
                            3,
                            (index) =>
                                TopNavigateItem(index, selectedTab: state.selectedTab, onClick: () {
                                  bloc.add(OnChangeTab(index));
                                })),
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
                                    isBorder: true,
                                    selectedTab: state.genreSelected != null
                                        ? state.genres.indexOf(state.genreSelected!)
                                        : 0, onClick: () {
                                  bloc.add(GenresSelectedEvent(state.genres[index]));
                                })),
                      ),
                    ),
                  ),
                  10.height,
                  const Expanded(
                    child: DiscoverMangaGridViewSection(),
                  )
                ]);
              }),
            ),
          );
        },
      ),
    );
  }
}
