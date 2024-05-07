import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/ui/widgets/common/ripple_button.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';

/// Generic Widget to be used mostly inside a Scaffold body
/// You must pass at least a page state and a success widget
class AppBody extends StatelessWidget {
  final PageState pageState;
  final Widget success;
  final Widget? initial;
  final Widget? loading;
  final Widget? failure;

  const AppBody({
    super.key,
    required this.pageState,
    required this.success,
    this.initial,
    this.loading,
    this.failure,
  });

  @override
  Widget build(BuildContext context) {
    return _bodyContent(context);
  }

  Widget _bodyContent(BuildContext context) {
    switch (pageState) {
      case PageState.initial:
        return initial ?? const SizedBox.shrink();
      case PageState.loading:
        return loading ?? const Center(child: CircularProgressIndicator(color: Colors.white));
      case PageState.failure:
        return failure ?? const SizedBox.shrink();
      case PageState.success:
        return success;
      case PageState.login:
        return Padding(
          padding: 10.paddingHorizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKey.keySignUpDescription.tr,
                style: GoogleFonts.cabin(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              10.height,
              Padding(
                padding: 100.paddingHorizontal,
                child: RippleButton(
                  title: LocaleKey.keySignIn.tr,
                  height: 46,
                  padding: 10.paddingAll,
                  backgroundColor: AppColors.primary,
                  onTap: () {
                    Get.find<NavigatorManager>().navigateToPage(AppPages.signIn);
                  },
                ),
              ),
            ],
          ),
        );
    }
  }
}
