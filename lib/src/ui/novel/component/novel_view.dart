import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/novel/component/novel_gridview.dart';
import 'package:zexonline/src/ui/novel/component/novel_top_navigate_item.dart';
import 'package:zexonline/src/ui/novel/interactor/novel_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class NovelView extends StatelessWidget {
  const NovelView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      isBackground: false,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: CustomAppBar(
          title: LocaleKey.novel.tr,
          implyLeading: false,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
              child: BlocBuilder<NovelBloc, NovelState>(
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
                            Get.find<NovelBloc>().add(OnChangeType(state.genres[index].id)),
                        tabs: List.generate(
                          state.genres.length,
                          (index) => NovelTopNavigateItem(
                            state.genres[index],
                          ),
                        ),
                      ),
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
  }
}
