import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/interactor/novel_chapter_detail_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class ThemeSettingWidget extends StatelessWidget {
  const ThemeSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<NovelChapterDetailBloc>();

    List<Color> backgroundColors = [
      const Color(0xFFFFFFFF),
      const Color(0xFFF0F1F2),
      const Color(0xFF505050),
      const Color(0xFF333333),
    ];
    return Row(
      children: [
        Padding(
          padding: 20.paddingHorizontal,
          child: Text(
            LocaleKey.theme.tr,
            style: GoogleFonts.cabin(
                color: AppColors.primary, fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        36.width,
        Expanded(
          child: SizedBox(
            height: 33,
            child: ListView.separated(
              padding: 0.paddingAll,
              itemCount: backgroundColors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final color = backgroundColors[index];
                return GestureDetector(
                  onTap: () => bloc.add(OnChangeViewStyle(color: color)),
                  child: Container(
                    width: 33,
                    decoration: BoxDecoration(
                        color: color,
                        border: Border.all(color: AppColors.black),
                        borderRadius: const BorderRadius.all(Radius.circular(4))),
                    child: Center(
                      child: Text(
                        LocaleKey.aa.tr,
                        style: GoogleFonts.cabin(
                            color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 6),
            ),
          ),
        ),
      ],
    );
  }
}
