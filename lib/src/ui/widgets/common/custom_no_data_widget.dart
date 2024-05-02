import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class CustomNoDataWidget extends StatelessWidget {
  final Color? color;

  const CustomNoDataWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKey.noData.tr.toUpperCase(),
        style: GoogleFonts.cabin(
          fontSize: 22,
          color: AppColors.black,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
