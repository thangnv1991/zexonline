import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class RippleButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? highlightColor;
  final ShapeBorder? customBorder;
  final bool enable;
  final double? height;
  final EdgeInsets? padding;
  final String? title;
  final Color? colorTitle;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final Color disabledColor;
  final EdgeInsets? margin;
  final double thickness;
  final double fontSizeTitle;
  final FontWeight? fontWeight;
  final BoxBorder? border;

  const RippleButton({
    super.key,
    this.child = const SizedBox(),
    this.onTap,
    this.onLongPress,
    this.backgroundColor,
    this.borderRadius,
    this.customBorder,
    this.highlightColor,
    this.enable = true,
    this.height,
    this.padding,
    this.title,
    this.colorTitle,
    this.boxShadow,
    this.width,
    this.disabledColor = Colors.white54,
    this.margin,
    this.thickness = 1,
    this.fontSizeTitle = 16,
    this.fontWeight,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.all(99.radius),
          boxShadow: enable ? boxShadow : null,
          border: border,
          color: backgroundColor,
          gradient: backgroundColor == null ? AppColors.gradient() : null),
      child: MaterialButton(
        color: AppColors.transparent,
        disabledColor: AppColors.secondary2,
        highlightColor: AppColors.secondary4,
        elevation: 0,
        minWidth: double.infinity,
        height: height,
        shape: customBorder ??
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.all(99.radius),
              side: BorderSide.none,
            ),
        onPressed: enable ? onTap : null,
        onLongPress: enable ? onLongPress : null,
        padding: padding ?? const EdgeInsets.all(16),
        child: title != null
            ? Text(
                title!,
                style: GoogleFonts.cabin(
                  color: colorTitle ?? Colors.white,
                  fontSize: fontSizeTitle,
                  fontWeight: fontWeight,
                ),
              )
            : child,
      ),
    );
  }
}
