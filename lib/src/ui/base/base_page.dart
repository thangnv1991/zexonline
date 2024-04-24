import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:zexonline/src/utils/app_assets.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class BasePage extends StatelessWidget {
  //   /// When screen has [TextField] or [TextFormField]
  //   /// Default is false
  //   ///
  //   /// If this is true, then touching outside [TextField] or [TextFormField]
  //   /// will unFocus and hide the keyboard
  final bool unFocusWhenTouchOutsideInput;

  final bool isBackground;

  //   /// The widget below this widget in the tree.
  //   ///
  //   /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  const BasePage({
    super.key,
    required this.child,
    this.unFocusWhenTouchOutsideInput = false,
    this.isBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return unFocusWhenTouchOutsideInput
        ? GestureDetector(
            onTap: () => Get.focusScope?.unfocus(),
            child: isBackground
                ? Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.gradient(),
                      image: const DecorationImage(
                        image: AssetImage(AppAssets.background_jpg),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: child,
                  )
                : child,
          )
        : isBackground
            ? Container(
                width: 100,
                height: 1000,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.background_jpg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: child,
              )
            : child;
  }
}
