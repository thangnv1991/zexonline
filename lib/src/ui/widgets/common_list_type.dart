import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/enums/enum_sort_type.dart';
import 'package:zexonline/src/enums/enum_story_type.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/widgets/horizontal_item.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';
import 'package:zexonline/src/utils/app_styles.dart';

class CommonListType extends StatelessWidget {
  final StoryType storyType;
  final SortType type;
  final List<StoryModel> data;

  const CommonListType({
    super.key,
    required this.storyType,
    required this.type,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 0),
      decoration: BoxDecoration(borderRadius: 16.borderRadiusAll, color: AppColors.secondary3),
      padding: 16.paddingAll,
      margin: 16.paddingHorizontal,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(type.title, style: AppStyles.fontSize18()),
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  Get.find<NavigatorManager>().navigateToPage(AppPages.moreStory, args: type);
                },
                child: Text(
                  LocaleKey.seeMore.tr,
                  style: AppStyles.fontSize12(color: AppColors.primary),
                ),
              ),
            ]),
            Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: data
                    .map((item) => HorizontalItem(
                          story: item,
                          onNavigateToDetail: () {
                            Get.find<NavigatorManager>()
                                .navigateToPage(AppPages.storyDetail(item.id!));
                          },
                        ))
                    .toList()),
          ]),
    );
  }
}
