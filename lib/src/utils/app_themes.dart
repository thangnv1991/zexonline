import 'package:flutter/material.dart';
import 'package:zexonline/src/extensions/themes/app_color_theme.dart';
import 'package:zexonline/src/extensions/themes/app_text_theme.dart';
import 'package:zexonline/src/utils/app_color_schemes.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_dimensions.dart';

class AppThemes {
  static ThemeData get darkTheme {
    final mtt = AppTextTheme.dark;

    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      appBarTheme: appBarThemeData(mtt),
      inputDecorationTheme: inputDecorationThemeData,
      elevatedButtonTheme: elevatedButtonThemeData,
      outlinedButtonTheme: outlinedButtonThemeData,
      buttonTheme: buttonThemeData,
      bottomSheetTheme: bottomSheetThemeData,
      bottomNavigationBarTheme: bottomNavigationThemeData(AppColorSchemes.darkColorScheme),
      colorScheme: AppColorSchemes.darkColorScheme,
      snackBarTheme: snackBarThemeData,
      scaffoldBackgroundColor: AppColorSchemes.darkColorScheme.onPrimary,
      extensions: <ThemeExtension<dynamic>>[
        AppColorTheme.dark,
        mtt,
      ],
      fontFamily: getFontFamily,
      dialogTheme: dialogThemeData,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      pageTransitionsTheme: pageTransitionsTheme,
    );
  }

  static ThemeData get lightTheme {
    final mtt = AppTextTheme.light;
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      appBarTheme: appBarThemeData(mtt),
      inputDecorationTheme: inputDecorationThemeData,
      elevatedButtonTheme: elevatedButtonThemeData,
      outlinedButtonTheme: outlinedButtonThemeData,
      buttonTheme: buttonThemeData,
      bottomSheetTheme: bottomSheetThemeData,
      bottomNavigationBarTheme: bottomNavigationThemeData(AppColorSchemes.lightColorScheme),
      colorScheme: AppColorSchemes.lightColorScheme,
      snackBarTheme: snackBarThemeData,
      scaffoldBackgroundColor: AppColorSchemes.lightColorScheme.onPrimary,
      extensions: <ThemeExtension<dynamic>>[
        AppColorTheme.dark,
        mtt,
      ],
      fontFamily: getFontFamily,
      dialogTheme: dialogThemeData,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      pageTransitionsTheme: pageTransitionsTheme,
    );
  }
}

Size get _minimumSize => const Size(AppDimensions.sized46, AppDimensions.sized46);

RoundedRectangleBorder get _shape => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(AppDimensions.sized8)),
    );

EdgeInsetsGeometry get _padding => AppDimensions.allMargins;

AppBarTheme appBarThemeData(AppTextTheme appTextTheme) => AppBarTheme(
      titleTextStyle: appTextTheme.size20W900,
      centerTitle: false,
      elevation: 0.0,
      backgroundColor: AppColorSchemes.lightColorScheme.surfaceVariant,
      surfaceTintColor: AppColorSchemes.lightColorScheme.surfaceVariant,
    );

InputDecorationTheme get inputDecorationThemeData => const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(width: 0),
      ),
    );

ElevatedButtonThemeData get elevatedButtonThemeData => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: _minimumSize,
        shape: _shape,
        padding: _padding,
      ),
    );

OutlinedButtonThemeData get outlinedButtonThemeData => OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: _minimumSize,
        shape: _shape,
        padding: _padding,
      ),
    );

ButtonThemeData get buttonThemeData => ButtonThemeData(
      shape: _shape,
      minWidth: double.maxFinite,
      padding: _padding,
    );

BottomSheetThemeData get bottomSheetThemeData => BottomSheetThemeData(
      backgroundColor: AppColorSchemes.lightColorScheme.surface,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppDimensions.sized16))),
    );

PageTransitionsTheme get pageTransitionsTheme => const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    });

BottomNavigationBarThemeData bottomNavigationThemeData(ColorScheme colorSchemes) {
  return BottomNavigationBarThemeData(
    backgroundColor: colorSchemes.onPrimary,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: colorSchemes.primary,
    unselectedItemColor: AppColors.primary,
    landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    type: BottomNavigationBarType.fixed,
  );
}

SnackBarThemeData get snackBarThemeData {
  return SnackBarThemeData(
    backgroundColor: AppColorSchemes.darkColorScheme.tertiary,
    actionTextColor: AppColorSchemes.darkColorScheme.primary,
    contentTextStyle: const TextStyle(color: AppColors.black),
  );
}

DialogTheme get dialogThemeData {
  return DialogTheme(
    backgroundColor: AppColorSchemes.darkColorScheme.tertiary,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28.0))),
  );
}
