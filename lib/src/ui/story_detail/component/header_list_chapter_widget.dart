import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';
import 'package:zexonline/src/utils/app_assets.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class HeaderListChapterWidget extends StatelessWidget {
  const HeaderListChapterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<StoryBloc>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKey.chapters.tr,
          style: GoogleFonts.cabin(
            fontSize: 16,
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Spacer(),
        24.width,
        // GestureDetector(
        //   //onTap: () => bloc.add(const OnChangeViewChapterType(false)),
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        //     decoration: BoxDecoration(
        //       color: AppColors.secondary3,
        //       borderRadius: 2.borderRadiusAll,
        //     ),
        //     child: Row(
        //       children: [
        //         SvgPicture.asset(AppAssets.ic_sort_svg),
        //         4.width,
        //         Text(
        //           LocaleKey.sort.tr.toUpperCase(),
        //           style: GoogleFonts.cabin(
        //             fontSize: 12,
        //             color: AppColors.white,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // 6.width,
        BlocBuilder<StoryBloc, StoryDetailState>(builder: (context, state) {
          return GestureDetector(
            onTap: () => bloc.add(OnChangeViewChapterType(state.gridView)),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              decoration: BoxDecoration(
                color: AppColors.secondary3,
                borderRadius: 2.borderRadiusAll,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.ic_view_svg),
                  4.width,
                  Text(
                    state.gridView
                        ? LocaleKey.view.tr.toUpperCase()
                        : LocaleKey.list.tr.toUpperCase(),
                    style: GoogleFonts.cabin(
                      fontSize: 12,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}
