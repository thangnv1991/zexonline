import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/model/genre.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/main/interactor/main_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class CategoryBottomSheet extends StatelessWidget {
  final Function(Genre genre) onSelectedGenre;
  const CategoryBottomSheet({super.key, required this.onSelectedGenre});

  @override
  Widget build(BuildContext context) {
    final List<Genre> genres = Get.find<MainBloc>().state.genres;
    return Container(
      height: Get.height / 2,
      padding: 12.paddingHorizontal,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: 8.borderRadiusTop,
      ),
      child: Column(
        children: [
          16.height,
          Text(
            LocaleKey.categories.tr,
            style: GoogleFonts.cabin(
              fontSize: 22,
              color: AppColors.secondary3,
              fontWeight: FontWeight.w600,
            ),
          ),
          8.height,
          Expanded(
            child: GridView.builder(
              padding: 10.paddingVertical,
              itemCount: genres.length,
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 85 / 36,
              ),
              itemBuilder: (context, index) {
                final genre = genres[index];
                return GestureDetector(
                  onTap: () {
                    Get.back();
                    onSelectedGenre(genre);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondary3,
                      borderRadius: 4.borderRadiusAll,
                    ),
                    child: Center(
                      child: Text(
                        genre.name,
                        style: GoogleFonts.cabin(
                          fontSize: 10,
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
