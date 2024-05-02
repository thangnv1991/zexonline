import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/widgets/common/image_widget.dart';
import 'package:zexonline/src/utils/app_assets.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_constants.dart';

class MangaHorizontalItem extends StatelessWidget {
  final StoryModel story;
  final double width;
  final double height;
  final bool isTop;
  final Function()? onNavigateToDetail;

  const MangaHorizontalItem({
    super.key,
    required this.story,
    this.height = 120,
    this.width = 90,
    this.isTop = true,
    required this.onNavigateToDetail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigateToDetail,
      child: ClipRRect(
        borderRadius: 4.borderRadiusAll,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              ImageWidget(
                image: AppConstants.domainImage(story.banner),
                fit: BoxFit.fitWidth,
                width: width,
              ),
              if (isTop)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration:
                            const BoxDecoration(color: AppColors.red, shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            '1',
                            style:
                                GoogleFonts.cabin(fontSize: 8, color: AppColors.black, height: .1),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _StaticsItem('${story.totalViews}', AppAssets.ic_eye_svg),
                          2.height,
                          _StaticsItem('${story.avgRating}', AppAssets.ic_star_svg),
                        ],
                      )
                    ],
                  ),
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: 4.paddingAll,
                  width: Get.width,
                  decoration: BoxDecoration(gradient: AppColors.linearGradient()),
                  child: Text(
                    story.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cabin(fontSize: 8, color: AppColors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StaticsItem extends StatelessWidget {
  final String icon;
  final String value;

  const _StaticsItem(this.value, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value,
          style: GoogleFonts.cabin(fontSize: 5, color: AppColors.black),
        ),
        4.width,
        SvgPicture.asset(icon, height: 8),
      ],
    );
  }
}
