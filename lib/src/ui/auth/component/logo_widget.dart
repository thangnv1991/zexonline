import 'package:flutter/material.dart';
import 'package:zexonline/src/utils/app_assets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Image.asset(AppAssets.ic_app_icon_png),
    );
  }
}
