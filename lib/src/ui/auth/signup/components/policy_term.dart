import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/enums/enum_webview_type.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class PolicyTerm extends StatelessWidget {
  const PolicyTerm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, top: 10),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: LocaleKey.keyTermPolicy1.tr,
              style: GoogleFonts.cabin(fontSize: 13),
            ),
            TextSpan(
              text: LocaleKey.keyTermPolicy2.tr,
              style: GoogleFonts.cabin(
                fontSize: 13,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.black,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.find<NavigatorManager>()
                      .navigateToPage(AppPages.webView(WebViewType.Privacy));
                },
            ),
            TextSpan(
              text: LocaleKey.keyTermPolicy3.tr,
              style: GoogleFonts.cabin(fontSize: 13),
            ),
            TextSpan(
              text: LocaleKey.keyTermPolicy4.tr,
              style: GoogleFonts.cabin(
                fontSize: 13,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.black,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.find<NavigatorManager>().navigateToPage(AppPages.webView(WebViewType.Term));
                },
            )
          ],
        ),
      ),
    );
  }
}
