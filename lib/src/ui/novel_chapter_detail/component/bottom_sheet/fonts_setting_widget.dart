import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/enums/enum_font_family.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/interactor/novel_chapter_detail_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class FontsSettingWidget extends StatelessWidget {
  const FontsSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<NovelChapterDetailBloc>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: 20.paddingHorizontal,
          child: Text(
            LocaleKey.fonts.tr,
            style: GoogleFonts.cabin(
                color: AppColors.primary, fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 66,
          child: ListView.separated(
            padding: 20.paddingHorizontal,
            itemCount: FontFamily.values.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final textStyle = FontFamily.values[index].textStyle;
              return GestureDetector(
                onTap: () => bloc.add(OnChangeViewStyle(fontFamily: FontFamily.values[index])),
                child: Container(
                  width: 100,
                  padding: 12.paddingHorizontal,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black), borderRadius: 4.borderRadiusAll),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKey.aa.tr,
                        style: textStyle.copyWith(
                            color: AppColors.primary, fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        (textStyle.fontFamily ?? '')
                                .split('_')
                                .firstWhereOrNull((element) => true) ??
                            '',
                        style: textStyle.copyWith(
                            color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w400),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => 6.width,
          ),
        ),
      ],
    );
  }
}
