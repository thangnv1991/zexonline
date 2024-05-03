import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class TopNavigateItem extends StatelessWidget {
  final int id;
  final String? title;
  final int selectedTab;
  final Function()? onClick;

  const TopNavigateItem(
    this.id, {
    this.title,
    required this.selectedTab,
    this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = selectedTab == id;
    return InkWell(
      onTap: () => onClick?.call(),
      child: Container(
        color: AppColors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Text(
          title ??
              (id == 1
                  ? LocaleKey.novel.tr
                  : id == 2
                      ? LocaleKey.audio.tr
                      : LocaleKey.manga.tr),
          style: GoogleFonts.cabin(
            fontSize: 20,
            color: isActive ? null : AppColors.black,
            foreground: isActive
                ? (Paint()
                  ..shader =
                      AppColors.gradient().createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 20.0)))
                : null,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
