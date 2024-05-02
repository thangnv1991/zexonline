import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/widgets/common/ripple_button.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class ButtonCreate extends StatelessWidget {
  final bool enable;
  final VoidCallback onTap;

  const ButtonCreate({super.key, required this.enable, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: RippleButton(
        enable: enable,
        onTap: enable ? onTap : null,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: Text(
          LocaleKey.keyCreateAccount.tr.toUpperCase(),
          style: GoogleFonts.cabin(
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
