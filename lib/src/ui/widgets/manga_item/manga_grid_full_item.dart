import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/widgets/common/image_widget.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class MangaGridFullItem extends StatelessWidget {
  final Function()? onNavigateToDetail;
  final StoryModel story;
  const MangaGridFullItem({
    super.key,
    required this.onNavigateToDetail,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigateToDetail,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: ClipRRect(
              borderRadius: 4.borderRadiusAll,
              clipBehavior: Clip.hardEdge,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: 4.borderRadiusAll,
                  gradient: AppColors.gradient(),
                ),
                width: 140,
                child: ImageWidget(image: story.banner!,fit: BoxFit.fitWidth,width: 140,),
              ),
            ),
          ),
          6.height,
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    story.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cabin(
                      fontSize: 13,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.height,
                  // Text(
                  //   '10 Hours Ago',
                  //   style: GoogleFonts.cabin(
                  //     fontSize: 10,
                  //     color: AppColors.white,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                ],
              ))
        ],
      ),
    );
  }
}
