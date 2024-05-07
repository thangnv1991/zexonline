import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/widgets/common/image_widget.dart';
import 'package:zexonline/src/ui/widgets/manga_item/rating_widget.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_constants.dart';
import 'package:zexonline/src/utils/app_styles.dart';

class MangaGridShortItem extends StatelessWidget {
  final StoryModel story;
  final Function()? onNavigateToDetail;
  final double? height;

  const MangaGridShortItem({
    super.key,
    required this.onNavigateToDetail,
    required this.story,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigateToDetail,
      child: Padding(
        padding: 4.paddingVertical,
        child: Row(
          children: [
            Expanded(
              flex: 75,
              child: ClipRRect(
                borderRadius: 10.borderRadiusAll,
                clipBehavior: Clip.hardEdge,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: 10.borderRadiusAll,
                    gradient: AppColors.gradient(),
                  ),
                  width: 84,
                  child: ImageWidget(
                    image: AppConstants.domainImage(story.banner),
                    fit: BoxFit.cover,
                    width: 84,
                    height: 117,
                  ),
                ),
              ),
            ),
            6.width,
            Expanded(
              flex: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    story.title ?? '',
                    maxLines: 2,
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
                  const Spacer(),
                  2.height,
                  Text(
                    '${story.totalViews} ${LocaleKey.views}',
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
