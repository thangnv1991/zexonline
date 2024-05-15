import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/enums/enum_sort_type.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/home/component/home_section_common_widget.dart';
import 'package:zexonline/src/ui/home/interactor/home_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_listview.dart';
import 'package:zexonline/src/ui/widgets/manga_item/manga_horizontal_item.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class MangaListViewSection extends StatelessWidget {
  const MangaListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => previous.topManga != current.topManga,
        builder: (context, state) {
          return HomeSectionCommonWidget(
            LocaleKey.topManga.tr,
            onTapSeeMore: () => Get.find<NavigatorManager>()
                .navigateToPage(AppPages.moreStory, args: SortType.Views),
            child: SizedBox(
              height: 120,
              child: CustomListView(
                scrollDirection: Axis.horizontal,
                padding: 6.paddingHorizontal,
                itemCount: state.topManga.length,
                itemBuilder: (context, index) {
                  final StoryModel item = state.topManga[index];

                  return MangaHorizontalItem(
                    story: item,
                    onNavigateToDetail: () => Get.find<NavigatorManager>()
                        .navigateToPage(AppPages.storyDetail(item.id ?? '')),
                  );
                },
                separatorBuilder: (context, index) => 6.width,
              ),
            ),
          );
        });
  }
}
