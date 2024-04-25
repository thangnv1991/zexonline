import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/widgets/common/image_widget.dart';
import 'package:zexonline/src/ui/widgets/manga_item/rating_widget.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_constants.dart';

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
                borderRadius: 4.borderRadiusAll,
                clipBehavior: Clip.hardEdge,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: 4.borderRadiusAll,
                    gradient: AppColors.gradient(),
                  ),
                  width: 140,
                  child: ImageWidget(
                    image: AppConstants.domainImage(story.banner),
                    fit: BoxFit.cover,
                    width: 140,
                    height: height,
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
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cabin(
                      fontSize: 13,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.height,
                  Text(
                    story.description ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cabin(
                      fontSize: 10,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  2.height,
                  Text(
                    '${story.totalViews} ${LocaleKey.views}',
                    style: GoogleFonts.cabin(
                      fontSize: 10,
                      color: AppColors.secondary4,
                      fontWeight: FontWeight.w700,
                    ),
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
