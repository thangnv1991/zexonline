import 'package:flutter/material.dart';
import 'package:zexonline/src/utils/app_fonts.dart';

@immutable
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle size8W300;
  final TextStyle size8W700;
  final TextStyle size10W700;
  final TextStyle size20W900;
  final TextStyle size12W400;
  final TextStyle size12W900;
  final TextStyle size13W400;
  final TextStyle size14W900;
  final TextStyle size14W500;
  final TextStyle size14W400;
  final TextStyle size15W400;
  final TextStyle size15W700;
  final TextStyle size15W900;
  final TextStyle size16W400;
  final TextStyle size18W400;
  final TextStyle size18W900;
  final TextStyle size20W700;
  final TextStyle size20W400;
  final TextStyle size22W900;
  final TextStyle size25W700;

  const AppTextTheme({
    required this.size8W300,
    required this.size8W700,
    required this.size10W700,
    required this.size20W900,
    required this.size12W400,
    required this.size12W900,
    required this.size13W400,
    required this.size14W900,
    required this.size14W500,
    required this.size14W400,
    required this.size15W400,
    required this.size15W700,
    required this.size15W900,
    required this.size16W400,
    required this.size18W400,
    required this.size18W900,
    required this.size20W700,
    required this.size20W400,
    required this.size22W900,
    required this.size25W700,
  });

  @override
  AppTextTheme copyWith({
    TextStyle? h1,
    TextStyle? h2,
  }) {
    return AppTextTheme(
      size8W300: size8W300,
      size8W700: size8W700,
      size10W700: size10W700,
      size20W900: size20W900,
      size12W400: size12W400,
      size12W900: size12W900,
      size13W400: size13W400,
      size14W900: size14W900,
      size14W500: size14W500,
      size14W400: size14W400,
      size15W400: size15W400,
      size15W700: size15W700,
      size15W900: size15W900,
      size16W400: size16W400,
      size18W400: size18W400,
      size18W900: size18W900,
      size20W700: size20W700,
      size20W400: size20W400,
      size22W900: size22W900,
      size25W700: size25W700,
    );
  }

  @override
  String toString() => 'AppCustomTexts';

  // the light theme
  static final light = AppTextTheme(
    size8W300: _size8W300,
    size8W700: _size8W700,
    size10W700: _size10W700,
    size20W900: _size20W900,
    size12W400: _size12W400,
    size12W900: _size12W900,
    size13W400: _size13W400,
    size14W900: _size14W900,
    size14W500: _size14W500,
    size14W400: _size14W400,
    size15W400: _size15W400,
    size15W700: _size15W700,
    size15W900: _size15W900,
    size16W400: _size16W400,
    size18W400: _size18W400,
    size18W900: _size18W900,
    size20W700: _size20W700,
    size20W400: _size20W400,
    size22W900: _size22W900,
    size25W700: _size25W700,
  );

  // the dark theme
  static final dark = AppTextTheme(
    size8W300: _size8W300,
    size8W700: _size8W700,
    size10W700: _size10W700,
    size20W900: _size20W900,
    size12W400: _size12W400,
    size12W900: _size12W900,
    size13W400: _size13W400,
    size14W900: _size14W900,
    size14W500: _size14W500,
    size14W400: _size14W400,
    size15W400: _size15W400,
    size15W700: _size15W700,
    size15W900: _size15W900,
    size16W400: _size16W400,
    size18W400: _size18W400,
    size18W900: _size18W900,
    size20W700: _size20W700,
    size20W400: _size20W400,
    size22W900: _size22W900,
    size25W700: _size25W700,
  );

  @override
  ThemeExtension<AppTextTheme> lerp(
      ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) {
      return this;
    }
    return AppTextTheme(
      size8W300: TextStyle.lerp(size8W300, other.size8W300, t)!,
      size8W700: TextStyle.lerp(size8W700, other.size8W700, t)!,
      size10W700: TextStyle.lerp(size10W700, other.size10W700, t)!,
      size20W900: TextStyle.lerp(size20W900, other.size20W900, t)!,
      size12W400: TextStyle.lerp(size12W400, other.size12W400, t)!,
      size12W900: TextStyle.lerp(size12W900, other.size12W900, t)!,
      size13W400: TextStyle.lerp(size13W400, other.size13W400, t)!,
      size14W900: TextStyle.lerp(size14W900, other.size14W900, t)!,
      size14W500: TextStyle.lerp(size14W500, other.size14W500, t)!,
      size14W400: TextStyle.lerp(size14W400, other.size14W400, t)!,
      size15W400: TextStyle.lerp(size15W400, other.size15W400, t)!,
      size15W700: TextStyle.lerp(size15W700, other.size15W700, t)!,
      size15W900: TextStyle.lerp(size15W900, other.size15W900, t)!,
      size16W400: TextStyle.lerp(size16W400, other.size16W400, t)!,
      size18W400: TextStyle.lerp(size18W400, other.size18W400, t)!,
      size18W900: TextStyle.lerp(size18W900, other.size18W900, t)!,
      size20W700: TextStyle.lerp(size20W700, other.size20W700, t)!,
      size20W400: TextStyle.lerp(size20W400, other.size20W400, t)!,
      size22W900: TextStyle.lerp(size22W900, other.size22W900, t)!,
      size25W700: TextStyle.lerp(size25W700, other.size25W700, t)!,
    );
  }
}

String get getFontFamily => AppFonts.fontQuicksand;

TextStyle get _size8W300 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 8,
    );

TextStyle get _size8W700 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 8,
    );

TextStyle get _size10W700 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 10,
    );

TextStyle get _size12W400 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );

TextStyle get _size12W900 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w900,
      fontSize: 12,
    );

TextStyle get _size13W400 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 13,
    );

TextStyle get _size14W900 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w900,
      fontSize: 14,
    );

TextStyle get _size14W500 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );

TextStyle get _size14W400 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );

TextStyle get _size15W400 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 15,
    );

TextStyle get _size15W700 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 15,
    );

TextStyle get _size15W900 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w900,
      fontSize: 15,
    );

TextStyle get _size16W400 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    );

TextStyle get _size18W400 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );

TextStyle get _size18W900 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w900,
      fontSize: 18,
    );

TextStyle get _size20W900 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w900,
      fontSize: 20,
    );

TextStyle get _size20W700 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    );

TextStyle get _size20W400 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    );

TextStyle get _size22W900 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w900,
      fontSize: 22,
    );

TextStyle get _size25W700 => TextStyle(
      fontFamily: getFontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 25,
    );
