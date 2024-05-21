import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';
import 'package:zexonline/src/ui/widgets/manga_item/rating_widget.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_utils.dart';

class GeneralInfoWidget extends StatelessWidget {
  const GeneralInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryBloc, StoryDetailState>(
        buildWhen: (previous, current) => previous.story != current.story,
        builder: (context, state) {
          final story = state.story!;
          return Container(
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.8),
              borderRadius: 10.borderRadiusAll,
            ),
            margin: 20.paddingHorizontal,
            padding: 10.paddingAll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width - 100,
                  child: Text(
                    story.title ?? '',
                    style: GoogleFonts.cabin(
                      fontSize: 22,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                4.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        story.author ?? '',
                        style: GoogleFonts.cabin(
                          fontSize: 18,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    4.width,
                    Text(
                      AppUtils.formatUtcTime(dateUtc: story.createdAt),
                      style: GoogleFonts.cabin(
                        fontSize: 12,
                        color: AppColors.text2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                4.height,
                Center(
                    child: RatingWidget(
                  story.avgRating ?? 0,
                  height: 16,
                  showText: true,
                  heightIcon: 18,
                )),
              ],
            ),
          );
        });
  }
}
