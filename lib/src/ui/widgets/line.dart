import 'package:flutter/material.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
    ]);
  }
}
