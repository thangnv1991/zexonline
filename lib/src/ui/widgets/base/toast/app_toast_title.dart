import 'package:flutter/material.dart';
import 'package:zexonline/src/enums/toast_type.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_dimensions.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AppToastTitle extends StatelessWidget {
  final ToastType toastType;

  const AppToastTitle({super.key, required this.toastType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          toastType.title,
          LinearPercentIndicator(
            width: Get.width * .32,
            lineHeight: AppDimensions.sized4,
            percent: 1.0,
            backgroundColor: AppColors.primary.withOpacity(.1),
            progressColor: AppColors.primary,
            animation: true,
            animationDuration: 3000,
            barRadius: const Radius.circular(AppDimensions.sized2),
            padding: const EdgeInsets.only(right: AppDimensions.sized6),
          ),
        ],
      ),
    );
  }
}
