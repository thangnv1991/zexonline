import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/enums/enum_option_action.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/extensions/string_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/main/main_page.dart';
import 'package:zexonline/src/ui/options/components/option_item.dart';
import 'package:zexonline/src/ui/options/components/vip_member_button.dart';
import 'package:zexonline/src/ui/options/interactor/options_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/utils/app_pages.dart';
import 'package:zexonline/src/utils/app_shared.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OptionsBloc, OptionsState>(builder: (context, state) {
      return BasePage(
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
                const VipMemberButton(),
                20.height,
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
                      return const SizedBox();
                    }
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
    });
  }
}
