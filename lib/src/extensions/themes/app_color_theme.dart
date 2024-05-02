import 'package:flutter/material.dart';
import 'package:zexonline/src/utils/app_colors.dart';

@immutable
class AppColorTheme extends ThemeExtension<AppColorTheme> {
  final Color? buttonTextColor;
  final Color? textColor;

  const AppColorTheme({required this.buttonTextColor, required this.textColor});

  @override
  AppColorTheme copyWith({Color? buttonTextColor, Color? textColor}) {
    return AppColorTheme(
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  String toString() => 'CustomColors';

  // the light theme
  static const light = AppColorTheme(buttonTextColor: AppColors.black, textColor: AppColors.black);

  // the dark theme
  static const dark = AppColorTheme(buttonTextColor: AppColors.black, textColor: AppColors.black);

  @override
  ThemeExtension<AppColorTheme> lerp(ThemeExtension<AppColorTheme>? other, double t) {
    if (other is! AppColorTheme) {
      return this;
    }
    return AppColorTheme(
      buttonTextColor: Color.lerp(buttonTextColor, other.buttonTextColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }
}
