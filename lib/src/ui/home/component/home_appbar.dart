import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/widgets/common/ripple_button.dart';
import 'package:zexonline/src/utils/app_assets.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Padding(
        padding: 12.paddingHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKey.hello.tr,
              style: GoogleFonts.cabin(fontSize: 18, color: AppColors.white),
            ),
            const SizedBox(height: 5),
            Text(
              LocaleKey.whichMangaSuitsYourCurrentMood.tr,
              style: GoogleFonts.cabin(fontSize: 13, color: AppColors.white),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: 12.paddingHorizontal,
          child: SizedBox(
            height: 50,
            width: 82,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RippleButton(
                    height: 40,
                    width: 82,
                    borderRadius: BorderRadius.circular(40),
                    padding: EdgeInsets.zero,
                    onTap: () {},
                    title: LocaleKey.extend.tr,
                    fontWeight: FontWeight.w600,
                    fontSizeTitle: 12,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    AppAssets.ic_crown_svg,
                    width: 16,
                    height: 16,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
      backgroundColor: AppColors.transparent,
      // Make sure appbar don't change background color when scroll
      surfaceTintColor: AppColors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
