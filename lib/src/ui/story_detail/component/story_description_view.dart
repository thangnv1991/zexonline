import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';
import 'package:zexonline/src/ui/widgets/line.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class StoryDescriptionView extends StatelessWidget {
  const StoryDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryBloc, StoryDetailState>(
        buildWhen: (previous, current) => previous.story != current.story,
        builder: (context, state) {
          final story = state.story!;
          return Padding(
            padding: 10.paddingHorizontal,
            child: ListView(
              padding: 0.paddingAll,
              children: [
                Text(
                  LocaleKey.description.tr,
                  style: GoogleFonts.cabin(
                    fontSize: 20,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Line(),
                8.height,
                AnimatedReadMoreText(
                  story.description ?? '',
                  maxLines: 3,
                  readMoreText: 'Xem thêm',
                  readLessText: 'Thu lại',
                  textStyle: GoogleFonts.cabin(
                    fontSize: 16,
                    color: AppColors.text2,
                    fontWeight: FontWeight.w400,
                  ),
                  buttonTextStyle: GoogleFonts.cabin(
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  expandOnTextTap: true,
                ),
                12.height,
                Text(
                  LocaleKey.genre.tr,
                  style: GoogleFonts.cabin(
                    fontSize: 20,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Line(),
                8.height,
                if (story.genres != null)
                  Wrap(
                      spacing: 12,
                      runSpacing: 6,
                      children: story.genres!.map((genre) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: 10.borderRadiusAll,
                            border: Border.all(color: AppColors.primary),
                          ),
                          child: Text(
                            genre.name,
                            style: GoogleFonts.cabin(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList())
              ],
            ),
          );
        });
  }
}
