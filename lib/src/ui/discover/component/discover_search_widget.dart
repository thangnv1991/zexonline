import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/discover/interactor/discover_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/text_form_field_common.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class DiscoverSearchWidget extends StatelessWidget {
  const DiscoverSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<DiscoverBloc>();
    return TextFormFieldCommon(
      margin: 6.paddingHorizontal,
      contentPadding: const EdgeInsets.fromLTRB(12, 14, 6, 14),
      hintText: LocaleKey.searchForAManga.tr,
      border: BorderInput.BORDER,
      borderRadius: 55,
      fontSize: 13,
      onChanged: (value) {
        bloc.add(OnChangeKeySearch(value));
      },
      onFieldSubmitted: (value) => bloc.add(const OnSearchStories(page: 1)),
      suffixIcon: IconButton(
        onPressed: () => bloc.add(const OnSearchStories(page: 1)),
        icon: Container(
            padding: 3.paddingAll,
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.secondary2,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.search,
              color: AppColors.black,
            )),
      ),
    );
  }
}
