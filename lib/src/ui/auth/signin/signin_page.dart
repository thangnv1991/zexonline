import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/auth/component/logo_widget.dart';
import 'package:zexonline/src/ui/auth/interactor/auth_bloc.dart';
import 'package:zexonline/src/ui/auth/signin/components/button_continue.dart';
import 'package:zexonline/src/ui/auth/signin/components/title_signin.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/ui/main/main_page.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/ui/widgets/common/loading_full_screen.dart';
import 'package:zexonline/src/ui/widgets/common/text_form_field_common.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<AuthBloc>()..add(const OnClearData()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          bool isValidate = state.email.isNotEmpty &&
              state.password.isNotEmpty &&
              state.validEmail.isEmpty &&
              state.validPassword.isEmpty;

          return PopScope(
            canPop: false,
            child: BasePage(
              unFocusWhenTouchOutsideInput: true,
              child: LoadingFullScreen(
                loading: state.status == PageState.loading,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  extendBodyBehindAppBar: true,
                  appBar: const CustomAppBar(backgroundColor: Colors.transparent),
                  body: Padding(
                    padding: EdgeInsets.only(top: Get.statusBarHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        50.height,
                        const Center(child: Logo()),
                        28.height,
                        const TitleSignIn(),
                        40.height,
                        TextFormFieldCommon(
                          padding: 10.paddingHorizontal,
                          label: LocaleKey.keyEmail.tr,
                          hintText: LocaleKey.keyEmailPlaceholder.tr,
                          border: BorderInput.BORDER,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            Get.find<AuthBloc>().add(OnChangeInputEmail(email: value));
                          },
                        ),
                        if (state.validEmail.isNotEmpty)
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: 10.paddingHorizontal,
                              child: Text(
                                textAlign: TextAlign.right,
                                state.validEmail,
                                style: GoogleFonts.cabin(
                                  fontSize: 13,
                                  color: AppColors.red,
                                ),
                              ),
                            ),
                          ),
                        20.height,
                        TextFormFieldCommon(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          label: LocaleKey.keyPassword.tr,
                          hintText: LocaleKey.keyPasswordPlaceholder.tr,
                          border: BorderInput.BORDER,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          onChanged: (value) {
                            Get.find<AuthBloc>().add(OnChangeInputPassword(password: value));
                          },
                          onFieldSubmitted: (String value) {
                            if (isValidate) {
                              Get.focusScope?.unfocus();

                              Get.find<AuthBloc>().add(OnClickSignIn(
                                  email: state.email,
                                  password: state.password,
                                  onSuccess: () {
                                    pages.clear();
                                    Get.offNamedUntil(AppPages.main, (route) => false);
                                  }));
                            }
                          },
                          textInputAction: TextInputAction.done,
                        ),
                        if (state.validPassword.isNotEmpty)
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: 10.paddingHorizontal,
                              child: Text(
                                textAlign: TextAlign.right,
                                state.validPassword,
                                style: GoogleFonts.cabin(
                                  fontSize: 13,
                                  color: AppColors.red,
                                ),
                              ),
                            ),
                          ),
                        // RememberMe(isRememberMe: state.isRemember),
                        const Spacer(),
                        ButtonContinue(
                          enable: isValidate,
                          onTap: () {
                            Get.find<AuthBloc>().add(OnClickSignIn(
                                email: state.email,
                                password: state.password,
                                onSuccess: () {
                                  pages.clear();
                                  Get.offNamedUntil(AppPages.main, (route) => false);
                                }));
                          },
                        ),
                        12.height,
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: LocaleKey.keySignUpDes1.tr,
                                  style: GoogleFonts.cabin(fontSize: 13),
                                ),
                                TextSpan(
                                  text: LocaleKey.keySignUpDes2.tr,
                                  style: GoogleFonts.cabin(
                                    fontSize: 13,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.black,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle the tap gesture here
                                      Get.find<NavigatorManager>().navigateToPage(AppPages.signUp);
                                    },
                                )
                              ],
                            ),
                          ),
                        ),
                        50.height,
                      ],
                    ),
                  ),
                  resizeToAvoidBottomInset: false,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
