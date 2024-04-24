import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          implyLeading: true,
          title: LocaleKey.becomeToVipMember.tr,
        ),
        body: ListView(
          padding: 0.paddingAll,
          children: [
            16.height,
          ],
        ),
      ),
    );
  }
}
