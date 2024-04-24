import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class HomeSectionCommonWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const HomeSectionCommonWidget(this.title, {required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.cabin(fontSize: 16, color: AppColors.white),
                  ),
                  Text(
                    LocaleKey.seeMore.tr,
                    style: GoogleFonts.cabin(fontSize: 16, color: AppColors.white),
                  ),
                ],
              ),
              Container(
                width: 24,
                height: 2,
                decoration: BoxDecoration(gradient: AppColors.gradient()),
              )
            ],
          ),
        ),
        12.height,
        child,
      ],
    );
  }
}
