import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/ui/manga_chapter_detail/interactor/manga_chapter_detail_bloc.dart';
import 'package:zexonline/src/utils/app_assets.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class MangaChapterDetailBottomAction extends StatelessWidget {
  final String? chapterPrevious;
  final String? chapterNext;

  const MangaChapterDetailBottomAction({super.key, this.chapterPrevious, this.chapterNext});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaChapterDetailBloc, MangaChapterDetailState>(
        buildWhen: (previous, current) =>
            previous.showBottomNavigation != current.showBottomNavigation,
        builder: (context, state) {
          final showBottomNavigate = state.showBottomNavigation == true;
          return AnimatedContainer(
            height: showBottomNavigate ? 72 : 0,
            width: showBottomNavigate ? Get.width : 0,
            color: showBottomNavigate ? AppColors.secondary1 : null,
            duration: const Duration(milliseconds: 50),
            child: showBottomNavigate
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (chapterPrevious != null) {
                              Get.find<MangaChapterDetailBloc>()
                                  .add(FetchChapterDetail(chapterPrevious));
                            }
                          },
                          icon: SvgPicture.asset(
                            AppAssets.ic_undo_svg,
                            colorFilter: chapterPrevious != null
                                ? null
                                : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppAssets.ic_sroll_vertical_svg)),
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: SvgPicture.asset(AppAssets.ic_scroll_horizontal_svg)),
                      IconButton(
                          onPressed: () {
                            if (chapterNext != null) {
                              Get.find<MangaChapterDetailBloc>()
                                  .add(FetchChapterDetail(chapterNext));
                            }
                          },
                          icon: SvgPicture.asset(
                            AppAssets.ic_redo_svg,
                            colorFilter: chapterNext != null
                                ? null
                                : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                          )),
                    ],
                  )
                : const SizedBox(),
          );
        });
  }
}
