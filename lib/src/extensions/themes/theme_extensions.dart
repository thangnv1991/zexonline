import 'package:flutter/material.dart';
import 'package:zexonline/src/extensions/themes/app_color_theme.dart';
import 'package:zexonline/src/extensions/themes/app_text_theme.dart';

extension ThemeExtensions on BuildContext {
  AppTextTheme get appTextTheme => Theme.of(this).extension<AppTextTheme>()!;

  AppColorTheme get appColorTheme => Theme.of(this).extension<AppColorTheme>()!;
}
