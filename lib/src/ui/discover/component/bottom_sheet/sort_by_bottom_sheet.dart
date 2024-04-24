import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/enums/enum_sort_type.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class SortByBottomSheet extends StatelessWidget {
  final Function(SortType sortType) onSelectedSortType;
  const SortByBottomSheet({super.key, required this.onSelectedSortType});

  @override
  Widget build(BuildContext context) {
    List<SortType> sortTypes = [...SortType.values];
    sortTypes.removeWhere((element) => element.name.isEmpty);
    return Container(
      height: Get.height * 0.4,
      padding: 12.paddingHorizontal,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: 8.borderRadiusTop,
      ),
      child: Column(
        children: [
          16.height,
          Text(
            LocaleKey.sortBy.tr,
            style: GoogleFonts.cabin(
              fontSize: 22,
              color: AppColors.secondary3,
              fontWeight: FontWeight.w600,
            ),
          ),
          8.height,
          Expanded(
            child: ListView.separated(
              padding: 0.paddingHorizontal,
              itemCount: sortTypes.length,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final sortType = sortTypes[index];
                return GestureDetector(
                  onTap: () {
                    Get.back();
                    onSelectedSortType(sortType);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.greyEB,
                      borderRadius: 4.borderRadiusAll,
                    ),
                    child: Center(
                      child: Text(
                        sortType.name,
                        style: GoogleFonts.cabin(
                          fontSize: 14,
                          color: AppColors.neutral,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => 8.height,
            ),
          ),
        ],
      ),
    );
  }
}
