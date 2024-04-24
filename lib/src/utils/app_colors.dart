import 'package:flutter/material.dart';

// Colors constant
class AppColors {
  static const primary = Color(0xFF071231);
  static const secondary1 = Color(0xFF0D1A3A);
  static const secondary2 = Color(0xFF384567);
  static const secondary3 = Color(0xFF5E72A7);
  static const secondary4 = Color(0xFF98B4FF);

  static const transparent = Color(0x00000000);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const red = Color(0xFFFE4F4F);
  static const neutral = Color(0xFF333333);

  static const greyF3 = Color(0xFFF3F3F3);
  static const greyEB = Color(0xFFEBEBEB);

  static LinearGradient gradient() {
    return const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
      Color(0xFF604BFF),
      Color(0xFFDA58F7),
    ]);
  }

  static LinearGradient linearGradient() {
    return LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
      const Color(0xFF000000).withOpacity(.3),
      const Color(0xFF000000),
    ]);
  }
}
