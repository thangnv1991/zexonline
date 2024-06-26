import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/widgets/common/ripple_button.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_styles.dart';

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
        height: 50,
        backgroundColor: AppColors.primary,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: enable ? onTap : null,
        child: Text(
          LocaleKey.keyCreateAccount.tr.toUpperCase(),
          style: AppStyles.fontSize12(
            color: enable ? AppColors.white : AppColors.textDisable,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
