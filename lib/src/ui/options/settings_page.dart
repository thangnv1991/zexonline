import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/enums/enum_option_action.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/extensions/string_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/main/main_page.dart';
import 'package:zexonline/src/ui/options/components/option_item.dart';
import 'package:zexonline/src/ui/options/interactor/options_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';
import 'package:zexonline/src/utils/app_shared.dart';
import 'package:zexonline/src/utils/app_utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<OptionsBloc>()..add(FetchSetting()),
      child: BlocConsumer<OptionsBloc, OptionsState>(
        listener: (context, state) {
          if (state.pageCommand is PageCommandNavigatorPage) {
            onNavigate(state.pageCommand as PageCommandNavigatorPage);
          }

          Get.find<OptionsBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          return BasePage(
            isBackground: false,
            child: Scaffold(
              backgroundColor: AppColors.white,
              extendBodyBehindAppBar: true,
              appBar: CustomAppBar(
                implyLeading: false,
                title: LocaleKey.settings.tr,
                backgroundColor: Colors.transparent,
              ),
              body: Padding(
                padding: 12.paddingHorizontal,
                child: Column(
                  children: [
                    const SizedBox(
                      height: kToolbarHeight + 40,
                    ),
                    // const VipMemberButton(),
                    // 20.height,
                    ...OptionAction.values.map((action) {
                      if ((action == OptionAction.Logout)) {
                        final appShared = Get.find<AppShared>();
                        final token = appShared.getTokenValue();

                        if (!(token).isNullOrEmpty()) {
                          return OptionItem(
                            action,
                            onTap: () {
                              appShared.setTokenValue("");
                              appShared.setUserData(null);
                              pages.clear();

                              Get.offNamedUntil(AppPages.main, (route) => false);
                            },
                          );
                        } else {
                          return 0.height;
                        }
                      } else if ((action == OptionAction.Notification)) {
                        return AppUtils.isLogin()
                            ? OptionItem(
                                action,
                                onTap: () => Get.find<OptionsBloc>().add(OnTapOptionItem(action)),
                              )
                            : 0.height;
                      } else {
                        return OptionItem(
                          action,
                          onTap: () => Get.find<OptionsBloc>().add(OnTapOptionItem(action)),
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void onNavigate(PageCommandNavigatorPage page) async {
  Get.find<NavigatorManager>().navigateToPage(page.page, args: page.argument);
}
