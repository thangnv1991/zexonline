import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';
import 'package:zexonline/src/ui/widgets/manga_item/rating_widget.dart';
import 'package:zexonline/src/utils/app_assets.dart';
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
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.statusBarHeight),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width - 100,
                    child: Text(
                      story.title ?? '',
                      style: GoogleFonts.cabin(fontSize: 18, color: AppColors.white),
                    ),
                  ),
                  4.height,
                  Text(
                    story.author ?? '',
                    style: GoogleFonts.cabin(
                        fontSize: 13, color: AppColors.white, fontWeight: FontWeight.w400),
                  ),
                  4.height,
                  Text(
                    '${AppUtils.formatUtcTime(dateUtc: story.createdAt)} - ${story.status?.toUpperCase()}',
                    style: GoogleFonts.cabin(
                        fontSize: 10, color: AppColors.white, fontWeight: FontWeight.w600),
                  ),
                  4.height,
                  RatingWidget(story.avgRating ?? 0, height: 16, showText: true),
                ],
              ),
              const Spacer(),
              24.width,
              IconButton(onPressed: () {}, icon: SvgPicture.asset(AppAssets.ic_share_svg))
            ],
          );
        });
  }
}
