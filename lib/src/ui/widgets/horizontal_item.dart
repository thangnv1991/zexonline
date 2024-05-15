import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/widgets/common/image_widget.dart';
import 'package:zexonline/src/ui/widgets/manga_item/rating_widget.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_constants.dart';
import 'package:zexonline/src/utils/app_styles.dart';
import 'package:zexonline/src/utils/app_utils.dart';

class HorizontalItem extends StatelessWidget {
  final StoryModel story;
  final Function()? onNavigateToDetail;
  final double height;

  const HorizontalItem({
    super.key,
    required this.onNavigateToDetail,
    required this.story,
    this.height = 140,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigateToDetail,
      child: Padding(
        padding: 4.paddingVertical,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: 10.borderRadiusAll,
              clipBehavior: Clip.hardEdge,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: 4.borderRadiusAll,
                  gradient: AppColors.gradient(),
                ),
                child: ImageWidget(
                  image: AppConstants.domainImage(story.banner),
                  fit: BoxFit.fitHeight,
                  height: height,
                  width: height * (2 / 3),
                ),
              ),
            ),
            6.width,
            SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    story.title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.fontSize12(fontWeight: FontWeight.w500),
                  ),
                  4.height,
                  Text(
                    story.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.fontSize10(fontWeight: FontWeight.w500),
                  ),
                  2.height,
                  Text(
                    '${AppUtils.formatNumber(story.totalViews ?? 0)} ${LocaleKey.rate.tr}',
                    style: AppStyles.fontSize10(color: AppColors.secondary1),
                  ),
                  2.height,
                  RatingWidget(story.avgRating ?? 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
