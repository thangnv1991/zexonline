import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class AppStyles {
  /// Title
  static fontSize18(
          {Color color = AppColors.black,
          FontWeight fontWeight = FontWeight.w500,
          double height = 1}) =>
      GoogleFonts.cabin(fontSize: 18, color: color, fontWeight: FontWeight.w500, height: height);

  /// SeeMore,
  static fontSize12({Color color = AppColors.black, FontWeight fontWeight = FontWeight.w400}) =>
      GoogleFonts.cabin(fontSize: 12, color: color, fontWeight: fontWeight);

  static fontSize10({Color color = AppColors.text1, FontWeight fontWeight = FontWeight.w400}) =>
      GoogleFonts.cabin(fontSize: 12, color: color, fontWeight: fontWeight);

  // Description Item
  static fontSize8({Color color = AppColors.black, FontWeight fontWeight = FontWeight.w400}) =>
      GoogleFonts.cabin(fontSize: 8, color: color, fontWeight: fontWeight);
}
