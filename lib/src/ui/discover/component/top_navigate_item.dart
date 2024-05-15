import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class TopNavigateItem extends StatelessWidget {
  final int id;
  final String? title;
  final int selectedTab;
  final bool isBorder;
  final Function()? onClick;

  const TopNavigateItem(
    this.id, {
    this.title,
    required this.selectedTab,
    this.isBorder = false,
    this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = selectedTab == id;
    return InkWell(
      onTap: () => onClick?.call(),
      child: Container(
        constraints: const BoxConstraints(minWidth: 100),
        decoration: isBorder
            ? BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.transparent,
                border: Border.all(color: isActive ? AppColors.primary : AppColors.transparent),
                borderRadius: 200.borderRadiusAll,
              )
            : const BoxDecoration(color: AppColors.transparent),
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
            color: isBorder
                ? isActive
                    ? AppColors.white
                    : AppColors.textDisable
                : isActive
                    ? AppColors.primary
                    : AppColors.textDisable,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
