import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/model/genre.dart';
import 'package:zexonline/src/ui/manga/interactor/manga_bloc.dart';
import 'package:zexonline/src/ui/novel/interactor/novel_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class MangaTopNavigateItem extends StatelessWidget {
  final Genre genre;

  const MangaTopNavigateItem(
    this.genre, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaBloc, MangaState>(
      buildWhen: (previous, current) => previous.selectedType != current.selectedType,
      builder: (context, state) {
        bool isActive = state.selectedType == genre.id;
        return Container(
          color: AppColors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          child: Text(
            genre.name,
            style: GoogleFonts.cabin(
              fontSize: 20,
              color: isActive ? null : AppColors.white,
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
