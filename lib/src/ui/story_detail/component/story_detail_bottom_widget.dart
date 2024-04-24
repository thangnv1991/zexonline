import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';
import 'package:zexonline/src/ui/widgets/base/toast/app_toast.dart';
import 'package:zexonline/src/ui/widgets/common/ripple_button.dart';
import 'package:zexonline/src/utils/app_assets.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';
import 'package:zexonline/src/utils/app_shared.dart';
import 'package:zexonline/src/utils/app_utils.dart';

import '../../../enums/enum_story_type.dart';

class StoryDetailBottomWidget extends StatelessWidget {
  const StoryDetailBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<StoryBloc>();
    return BlocBuilder<StoryBloc, StoryDetailState>(builder: (context, state) {
      bool isFavorite = state.story?.isFavorite ?? false;
      return Padding(
        padding: 16.paddingVertical,
        child: Row(
          children: [
            Expanded(
              child: RippleButton(
                onTap: () => bloc.add(OnFavoriteStory(storyId: state.id!)),
                height: 48,
                padding: 0.paddingAll,
                backgroundColor: AppColors.transparent,
                borderRadius: 8.borderRadiusAll,
                border: Border.all(color: isFavorite ? Colors.amberAccent : AppColors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.ic_save_add_svg,
                      colorFilter: ColorFilter.mode(
                        isFavorite ? Colors.amberAccent : AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    6.width,
                    Text(
                      LocaleKey.favorite.tr.toUpperCase(),
                      style: GoogleFonts.cabin(
                        color: isFavorite ? Colors.amberAccent : AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            12.width,
            Expanded(
              flex: 2,
              child: RippleButton(
                onTap: () {
                  // First Chapter
                  if (state.chapters.firstOrNull == null) {
                    showErrorToast(LocaleKey.noData);
                  } else {
                    if (!AppUtils.isLogin()) {
                      final appShared = Get.find<AppShared>();
                      List<String> idsStory = appShared.getIdsReadNowGuest();

                      if (state.story?.id != null && !idsStory.contains(state.story!.id)) {
                        idsStory.add(state.story!.id!);

                        appShared.setIdsReadNowGuest(idsStory);
                      }
                    }

                    final storyType = state.story?.storyType();
                    if (storyType == StoryType.Novel) {
                      bloc.add(OnNavigatePage(PageCommandNavigatorPage(
                          page: AppPages.novelChapterDetail(state.chapters.firstOrNull!.id))));
                    } else if (storyType == StoryType.Comic) {
                      bloc.add(OnNavigatePage(PageCommandNavigatorPage(
                          page: AppPages.mangaChapterDetail(state.chapters.firstOrNull!.id))));
                    }
                  }
                },
                height: 48,
                padding: 0.paddingAll,
                borderRadius: 8.borderRadiusAll,
                backgroundColor: AppColors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.ic_novel_svg,
                      colorFilter: const ColorFilter.mode(
                        AppColors.secondary2,
                        BlendMode.srcIn,
                      ),
                    ),
                    6.width,
                    Text(
                      LocaleKey.readNow.tr.toUpperCase(),
                      style: GoogleFonts.cabin(
                        color: AppColors.secondary2,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
