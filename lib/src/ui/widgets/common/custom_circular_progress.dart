import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class CustomCircularProgress extends StatelessWidget {
  final Color color;

  const CustomCircularProgress({super.key, this.color = AppColors.black});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator(
              color: Colors.amber,
            )
          : CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color),
              strokeWidth: 1.5,
            ),
    );
  }
}
