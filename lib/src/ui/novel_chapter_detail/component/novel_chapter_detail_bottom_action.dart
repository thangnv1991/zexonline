import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/enums/enum_sheet_type.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/interactor/novel_chapter_detail_bloc.dart';
import 'package:zexonline/src/utils/app_assets.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class NovelChapterDetailBottomAction extends StatelessWidget {
  final String? chapterPrevious;
  final String? chapterNext;

  const NovelChapterDetailBottomAction({super.key, this.chapterPrevious, this.chapterNext});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<NovelChapterDetailBloc>();
    return BlocBuilder<NovelChapterDetailBloc, NovelChapterDetailState>(
        buildWhen: (previous, current) => previous.hideAction != current.hideAction,
        builder: (context, state) {
          return state.hideAction
              ? 0.height
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 56,
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                    decoration: BoxDecoration(
                      borderRadius: 55.borderRadiusAll,
                      color: AppColors.primary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        IconButton(
                            onPressed: () => Get.find<NavigatorManager>().popBack(),
                            icon: SvgPicture.asset(AppAssets.ic_close_svg)),
                        IconButton(
                            onPressed: () {
                              if (chapterPrevious != null) {
                                Get.find<NovelChapterDetailBloc>()
                                    .add(FetchChapterDetail(chapterPrevious));
                              }
                            },
                            icon: SvgPicture.asset(
                              AppAssets.ic_undo_svg,
                              colorFilter: chapterPrevious != null
                                  ? null
                                  : const ColorFilter.mode(AppColors.textDisable, BlendMode.srcIn),
                            )),
                        IconButton(
                            onPressed: () {
                              if (chapterNext != null) {
                                Get.find<NovelChapterDetailBloc>()
                                    .add(FetchChapterDetail(chapterNext));
                              }
                            },
                            icon: SvgPicture.asset(
                              AppAssets.ic_redo_svg,
                              colorFilter: chapterNext != null
                                  ? null
                                  : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                            )),
                        IconButton(
                            onPressed: () => bloc.add(OnShowBottomSheet(
                                PageCommandShowBottomSheet(sheetType: SheetType.NovelSetting))),
                            icon: SvgPicture.asset(AppAssets.ic_setting_svg)),
                      ],
                    ),
                  ),
                );
        });
  }
}
