import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/auth/interactor/auth_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class RememberMe extends StatelessWidget {
  final bool isRememberMe;

  const RememberMe({super.key, required this.isRememberMe});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          splashRadius: 2,
          side: const BorderSide(color: AppColors.black),
          activeColor: AppColors.black,
          value: isRememberMe,
          onChanged: (bool? value) {
            Get.find<AuthBloc>().add(OnCheckedRemember(isRemember: isRememberMe));
          },
        ),
        Text(LocaleKey.keyRememberMe.tr,
            style: GoogleFonts.cabin(fontSize: 14, color: AppColors.black)),
      ],
    );
  }
}
