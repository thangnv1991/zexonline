import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/widgets/common/image_widget.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_constants.dart';
import 'package:zexonline/src/utils/app_styles.dart';

class MangaHorizontalItem extends StatelessWidget {
  final StoryModel story;
  final double width;
  final double height;
  final bool isTop;
  final Function()? onNavigateToDetail;

  const MangaHorizontalItem({
    super.key,
    required this.story,
    this.height = 117,
    this.width = 84,
    this.isTop = true,
    required this.onNavigateToDetail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigateToDetail,
      child: ClipRRect(
        borderRadius: 10.borderRadiusAll,
        // clipBehavior: Clip.hardEdge,
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
              Align(
                alignment: Alignment.bottomCenter,
                child: BlurryContainer(
                  blur: 4,
                  width: width,
                  height: 31,
                  elevation: 0,
                  color: AppColors.white.withOpacity(0.75),
                  padding: 4.paddingAll,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  child: Center(
                    child: Text(
                      story.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.fontSize12(fontWeight: FontWeight.w500),
                    ),
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
