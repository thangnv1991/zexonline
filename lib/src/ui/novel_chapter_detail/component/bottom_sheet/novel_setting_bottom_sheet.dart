import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/component/bottom_sheet/font_size_setting_widget.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/component/bottom_sheet/theme_setting_widget.dart';
import 'package:zexonline/src/utils/app_colors.dart';

import 'fonts_setting_widget.dart';

class NovelSettingBottomSheet extends StatelessWidget {
  const NovelSettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.black, borderRadius: 30.borderRadiusTop),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              LocaleKey.settings.tr,
              style: GoogleFonts.cabin(
                  color: AppColors.primary, fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          36.height,
          const FontsSettingWidget(),
          36.height,
          const FontSizeSettingWidget(),
          36.height,
          const ThemeSettingWidget()
        ],
      ),
    );
  }
}
