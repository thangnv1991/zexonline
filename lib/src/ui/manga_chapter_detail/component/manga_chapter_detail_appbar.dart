import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/manga_chapter_detail/interactor/manga_chapter_detail_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class MangaChapterDetailAppBar extends StatelessWidget {
  const MangaChapterDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool saveShowBottomNavigate = true;

    return SliverAppBar(
      stretch: true,
      titleSpacing: 0,
      leadingWidth: 0,
      pinned: true,
      backgroundColor: AppColors.white,
      bottom: const PreferredSize(preferredSize: Size.zero, child: SizedBox()),
      title: VisibilityDetector(
        key: UniqueKey(),
        onVisibilityChanged: (visibilityInfo) {
          var visiblePercentage = visibilityInfo.visibleFraction * 100;
          if (visiblePercentage == 0) {
            if (saveShowBottomNavigate == true) {
              Get.find<MangaChapterDetailBloc>().add(const OnShowBottomNavigation(false));
            }
            saveShowBottomNavigate = false;
          } else {
            if (saveShowBottomNavigate == false) {
              Get.find<MangaChapterDetailBloc>().add(const OnShowBottomNavigation(true));
            }
            saveShowBottomNavigate = true;
          }
        },
        child: BlocBuilder<MangaChapterDetailBloc, MangaChapterDetailState>(
            buildWhen: (previous, current) => previous.chapter != current.chapter,
            builder: (context, state) {
              final chapter = state.chapter;
              return CustomAppBar(
                implyLeading: true,
                backgroundColor: AppColors.white,
                titleWidget: Column(
                  children: [
                    Text(
                      chapter?.title ?? "",
                      style: GoogleFonts.cabin(
                        fontSize: 16,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    4.height,
                    Text(
                      '${chapter?.order ?? 1}/${chapter?.totalOrder ?? 1}',
                      style: GoogleFonts.cabin(
                        fontSize: 13,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                actions: [
                  // IconButton(onPressed: () {}, icon: SvgPicture.asset(AppAssets.ic_list_svg))
                ],
              );
            }),
      ),
    );
  }
}
