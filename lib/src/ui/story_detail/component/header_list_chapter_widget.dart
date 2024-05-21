import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';
import 'package:zexonline/src/ui/widgets/line.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class HeaderListChapterWidget extends StatelessWidget {
  const HeaderListChapterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<StoryBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKey.chapters.tr,
          style: GoogleFonts.cabin(
            fontSize: 20,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Line(),
      ],
    );
  }
}
