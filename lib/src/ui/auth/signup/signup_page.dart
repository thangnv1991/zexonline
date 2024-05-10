import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/auth/interactor/auth_bloc.dart';
import 'package:zexonline/src/ui/auth/signup/components/button_create.dart';
import 'package:zexonline/src/ui/auth/signup/components/policy_term.dart';
import 'package:zexonline/src/ui/auth/signup/components/title_signin.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/ui/main/main_page.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/ui/widgets/common/loading_full_screen.dart';
import 'package:zexonline/src/ui/widgets/common/text_form_field_common.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                    backgroundColor: AppColors.white,
                    extendBodyBehindAppBar: true,
                    appBar: const CustomAppBar(backgroundColor: AppColors.white),
                    body: Padding(
                      padding: EdgeInsets.only(top: Get.statusBarHeight),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            50.height,
                            28.height,
                            const TitleSignUp(),
                            40.height,
                            TextFormFieldCommon(
                              padding: 10.paddingHorizontal,
                              label: LocaleKey.keyYourName.tr,
                              hintText: LocaleKey.keyYourNamePlaceholder.tr,
                              border: BorderInput.BORDER,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                Get.find<AuthBloc>().add(OnChangeInputUsername(username: value));
                              },
                            ),
                            20.height,
                            TextFormFieldCommon(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              onChanged: (value) {
                                Get.find<AuthBloc>().add(OnChangeInputPassword(password: value));
                              },
                              onFieldSubmitted: (String value) {
                                if (isValidate) {
                                  Get.focusScope?.unfocus();

                                  Get.find<AuthBloc>().add(OnClickSignUp(
                                      email: state.email,
                                      password: state.password,
                                      username: state.username,
                                      onSuccess: () {
                                        pages.clear();

                                        Get.offNamedUntil(AppPages.main, (route) => false);
                                      }));
                                }
                              },
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
                            const PolicyTerm(),
                            35.height,
                            ButtonCreate(
                              enable: isValidate,
                              onTap: () {
                                Get.find<AuthBloc>().add(OnClickSignUp(
                                    email: state.email,
                                    password: state.password,
                                    username: state.username,
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
                                      text: LocaleKey.keySignInDes1.tr,
                                      style: GoogleFonts.cabin(fontSize: 13),
                                    ),
                                    TextSpan(
                                      text: LocaleKey.keySignInDes2.tr,
                                      style: GoogleFonts.cabin(
                                        fontSize: 13,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.black,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.find<NavigatorManager>().popBack();
                                        },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            30.height,
                          ],
                        ),
                      ),
                    ),
                    resizeToAvoidBottomInset: true,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
