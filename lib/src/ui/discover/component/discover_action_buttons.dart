import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/enums/enum_sheet_type.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/discover/interactor/discover_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/ripple_button.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class DiscoverActionButtons extends StatelessWidget {
  const DiscoverActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
        buildWhen: (previous, current) =>
            previous.selectedGenre != current.selectedGenre ||
            previous.selectedSortType != current.selectedSortType,
        builder: (context, state) {
          return Padding(
            padding: 6.paddingHorizontal,
            child: Row(
              children: [
                Expanded(
                  child: RippleButton(
                    onTap: () => Get.find<DiscoverBloc>().add(OnShowBottomSheet(
                        PageCommandShowBottomSheet(sheetType: SheetType.Category))),
                    height: 46,
                    padding: 0.paddingAll,
                    borderRadius: 4.borderRadiusAll,
                    backgroundColor: AppColors.black,
                    child: _childButton(LocaleKey.category.tr, state.selectedGenre?.name ?? ''),
                  ),
                ),
                6.width,
                Expanded(
                  child: RippleButton(
                    onTap: () => Get.find<DiscoverBloc>().add(
                        OnShowBottomSheet(PageCommandShowBottomSheet(sheetType: SheetType.SortBy))),
                    height: 46,
                    padding: 0.paddingAll,
                    borderRadius: 4.borderRadiusAll,
                    backgroundColor: AppColors.black,
                    child: _childButton(LocaleKey.sortBy.tr, state.selectedSortType.name),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _childButton(String title, String description) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: title,
            style: GoogleFonts.cabin(
              color: AppColors.secondary1,
              fontSize: 14,
            )),
        if (description.isNotEmpty)
          TextSpan(
              text: '\n$description',
              style: GoogleFonts.cabin(
                color: AppColors.secondary1,
                fontSize: 14,
              )),
      ]),
    );
  }
}
