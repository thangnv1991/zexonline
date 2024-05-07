import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_styles.dart';

class HomeSectionCommonWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback? onTapSeeMore;

  const HomeSectionCommonWidget(this.title, {required this.child, this.onTapSeeMore, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: 6.paddingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppStyles.fontSize18(),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: const Size(70, 22),
                      maximumSize: const Size(70, 22),
                      side: const BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                    onPressed: () {
                      onTapSeeMore?.call();
                    },
                    child: Text(
                      LocaleKey.seeMore.tr,
                      style: AppStyles.fontSize12(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              4.height,
              Row(children: [
                Container(
                  width: 24,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: 20.borderRadiusLeft,
                    border: Border.all(),
                  ),
                ),
                Container(
                  width: 24,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: 20.borderRadiusRight,
                    border: Border.all(),
                  ),
                )
              ])
            ],
          ),
        ),
        12.height,
        child,
      ],
    );
  }
}
