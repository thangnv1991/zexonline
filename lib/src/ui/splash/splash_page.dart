import 'package:flutter/material.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/widgets/common/loading_full_screen.dart';
import 'package:get/get.dart';

import 'splash_viewmodel.dart';

class SplashPage extends GetView<SplashViewModel> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Obx(() {
        return LoadingFullScreen(
          loading: controller.isLoading,
          child: const Scaffold(
            body: Center(
              child: Text(
                "SPLASH",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
