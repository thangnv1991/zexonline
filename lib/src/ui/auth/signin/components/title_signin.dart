import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class TitleSignIn extends StatelessWidget {
  const TitleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKey.keySignIn.tr,
            style: GoogleFonts.cabin(
              fontSize: 22,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          12.height,
          Text(
            LocaleKey.keySignInDescription.tr,
            style: GoogleFonts.cabin(
              fontSize: 13,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
