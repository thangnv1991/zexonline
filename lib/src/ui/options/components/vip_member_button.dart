import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/widgets/common/ripple_button.dart';
import 'package:zexonline/src/utils/app_assets.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class VipMemberButton extends StatelessWidget {
  const VipMemberButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RippleButton(
      onTap: () {
        Get.find<NavigatorManager>().navigateToPage(AppPages.payment);
      },
      backgroundColor: AppColors.white,
      borderRadius: 10.borderRadiusAll,
      height: 52,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.ic_vip_crown_svg),
          12.width,
          Text(
            LocaleKey.becomeToVipMember.tr,
            style: GoogleFonts.cabin(
              fontSize: 16,
              foreground: Paint()
                ..shader =
                    AppColors.gradient().createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 20.0)),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
