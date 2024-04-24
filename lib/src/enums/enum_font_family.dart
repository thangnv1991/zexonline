import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum FontFamily {
  quicksand,
  lexend,
  cabin,
  abel,
  sahitya;

  TextStyle get textStyle {
    switch (this) {
      case FontFamily.quicksand:
        return GoogleFonts.quicksand();
      case FontFamily.lexend:
        return GoogleFonts.lexend();
      case FontFamily.cabin:
        return GoogleFonts.cabin();
      case FontFamily.sahitya:
        return GoogleFonts.sahitya();
      case FontFamily.abel:
        return GoogleFonts.abel();
    }
  }
}

FontFamily getFontFamily(String? value) {
  switch (value) {
    case 'quicksand':
      return FontFamily.quicksand;
    case 'lexend':
      return FontFamily.lexend;
    case 'abel':
      return FontFamily.abel;
    case 'sahitya':
      return FontFamily.sahitya;
    default:
      return FontFamily.cabin;
  }
}
