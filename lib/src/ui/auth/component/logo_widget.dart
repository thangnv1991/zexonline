import 'package:flutter/material.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/utils/app_assets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 80.paddingHorizontal,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(50), child: Image.asset(AppAssets.ic_app_icon_png)),
    );
  }
}
