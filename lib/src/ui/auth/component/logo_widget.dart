import 'package:flutter/material.dart';
import 'package:zexonline/src/utils/app_assets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Image.asset(AppAssets.ic_app_icon_png),
    );
  }
}
