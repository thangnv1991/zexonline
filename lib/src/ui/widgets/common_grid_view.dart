import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/enums/enum_sort_type.dart';
import 'package:zexonline/src/enums/enum_story_type.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/widgets/common/custom_gridview.dart';
import 'package:zexonline/src/ui/widgets/manga_item/manga_grid_full_item.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';
import 'package:zexonline/src/utils/app_styles.dart';

class CommonGridView extends StatelessWidget {
  final StoryType storyType;
  final SortType type;
  final List<StoryModel> data;
  final bool isLoading;

  const CommonGridView({
    super.key,
    required this.storyType,
    required this.type,
    required this.data,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.height,
        Padding(
          padding: 16.paddingHorizontal,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              type.title,
              style: AppStyles.fontSize18(),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: const Size(70, 22),
                maximumSize: const Size(70, 22),
                side: const BorderSide(
                  color: AppColors.primary,
                ),
              ),
              onPressed: () {
                Get.find<NavigatorManager>().navigateToPage(AppPages.moreStory, args: type);
              },
              child: Text(
                LocaleKey.seeMore.tr,
                style: AppStyles.fontSize12(color: AppColors.primary),
              ),
            ),
          ]),
        ),
        10.height,
        CustomGridView(
          itemCount: data.length,
          itemRatio: 0.50,
          isLoading: isLoading,
          itemBuilder: (context, index, heightItem) {
            final item = data[index];
            return MangaGridFullItem(
              story: item,
              onNavigateToDetail: () =>
                  Get.find<NavigatorManager>().navigateToPage(AppPages.storyDetail(item.id!)),
            );
          },
        ),
      ],
    );
  }
}
