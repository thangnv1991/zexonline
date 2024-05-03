import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/novel/interactor/novel_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class NovelTopNavigateItem extends StatelessWidget {
  final int id;

  const NovelTopNavigateItem(
    this.id, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NovelBloc, NovelState>(
      builder: (context, state) {
        bool isActive = state.selectedTab == id;
        return Container(
          color: AppColors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: Text(
            id == 1
                ? LocaleKey.novel.tr
                : id == 2
                    ? LocaleKey.audio.tr
                    : LocaleKey.manga.tr,
            style: GoogleFonts.cabin(
              fontSize: 20,
              color: isActive ? null : AppColors.black,
              foreground: isActive
                  ? (Paint()
                    ..shader = AppColors.gradient()
                        .createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 20.0)))
                  : null,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}
