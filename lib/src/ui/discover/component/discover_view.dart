import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/discover/component/discover_action_buttons.dart';
import 'package:zexonline/src/ui/discover/component/discover_manga_gridview_section.dart';
import 'package:zexonline/src/ui/discover/component/discover_search_widget.dart';
import 'package:zexonline/src/ui/discover/interactor/discover_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/ui/widgets/common/custom_gridview.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DiscoverBloc>();

    return BasePage(
      unFocusWhenTouchOutsideInput: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          implyLeading: true,
          title: LocaleKey.discover.tr,
          backgroundColor: Colors.transparent,
        ),
        body: BlocBuilder<DiscoverBloc, DiscoverState>(
            buildWhen: (previous, current) => previous.isLoadMore != current.isLoadMore,
            builder: (context, state) {
              return NotificationListener(
                onNotification: (ScrollNotification scrollNotification) {
                  if (scrollNotification.metrics.pixels >=
                      scrollNotification.metrics.maxScrollExtent / 2) {
                    if (!state.isLoadMore) bloc.add(const OnSearchStories());
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: () async {
                    bloc.add(const OnSearchStories(page: 1));
                  },
                  child: ListView(
                    padding: 0.paddingAll,
                    children: [
                      16.height,
                      const DiscoverSearchWidget(),
                      12.height,
                      const DiscoverActionButtons(),
                      16.height,
                      const DiscoverMangaGridViewSection(),
                      80.height,
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
