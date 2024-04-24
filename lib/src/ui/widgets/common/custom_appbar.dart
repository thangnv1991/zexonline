import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/utils/app_assets.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.height = kToolbarHeight,
    this.backgroundColor,
    this.implyLeading = true,
    this.title = '',
    this.actions,
    this.padding,
    this.componentsColor,
    this.titleWidget,
    this.scrolledUnderElevation,
    this.onBack,
  });

  final double height;
  final Color? backgroundColor;
  final bool implyLeading;
  final String title;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;
  final Color? componentsColor;
  final Widget? titleWidget;
  final double? scrolledUnderElevation;
  final Function()? onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: implyLeading
          ? Padding(
              padding: padding ?? EdgeInsets.zero,
              child: IconButton(
                onPressed: onBack ?? () => Get.find<NavigatorManager>().popBack(),
                splashRadius: 24,
                icon: SvgPicture.asset(
                  AppAssets.ic_arrow_left_svg,
                ),
              ),
            )
          : const SizedBox(),
      titleSpacing: 0,
      centerTitle: true,
      leadingWidth: implyLeading ? 41 : 24,
      title: titleWidget ??
          Text(title,
              style: GoogleFonts.cabin(
                fontSize: 22,
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              )),
      // Make sure appbar don't change background color when scroll
      surfaceTintColor: backgroundColor ?? AppColors.transparent,
      actions: actions != null && actions!.isNotEmpty
          ? List.generate(
              actions!.length,
              (index) => actions![actions!.length - index - 1],
            )
          : null,
      scrolledUnderElevation: scrolledUnderElevation,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
