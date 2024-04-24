import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/interactor/novel_chapter_detail_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FontSizeSettingWidget extends StatelessWidget {
  const FontSizeSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<NovelChapterDetailBloc>();
    return BlocBuilder<NovelChapterDetailBloc, NovelChapterDetailState>(
        bloc: bloc,
        buildWhen: (previous, current) => previous.fontSize != current.fontSize,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: 20.paddingHorizontal,
                child: Text(
                  LocaleKey.fontSize.tr,
                  style: GoogleFonts.cabin(
                      color: AppColors.primary, fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
              SfSlider(
                min: 12,
                max: 30,
                value: state.fontSize,
                interval: 1,
                onChanged: (value) {
                  bloc.add(OnChangeViewStyle(fontSize: value));
                },
              ),
            ],
          );
        });
  }
}
