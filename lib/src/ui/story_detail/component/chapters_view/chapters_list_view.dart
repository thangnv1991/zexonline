import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/model/chapter_model.dart';
import 'package:zexonline/src/enums/enum_story_type.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';
import 'package:zexonline/src/ui/widgets/base/toast/app_toast.dart';
import 'package:zexonline/src/ui/widgets/common/custom_listview.dart';
import 'package:zexonline/src/utils/app_assets.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';
import 'package:zexonline/src/utils/app_shared.dart';
import 'package:zexonline/src/utils/app_utils.dart';

class ChaptersListView extends StatelessWidget {
  final StoryType? storyType;
  final List<ChapterModel> chapters;
  final String storyId;
  final int currentPage;

  const ChaptersListView(this.chapters, this.storyType, this.storyId,
      {super.key, this.currentPage = 0});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<StoryBloc>();
    return CustomListView(
      padding: 0.paddingAll,
      itemCount: chapters.length,
      itemBuilder: (BuildContext context, int index) {
        final ChapterModel chapter = chapters[index];
        return GestureDetector(
          onTap: () {
            if (!AppUtils.isLogin()) {
              final appShared = Get.find<AppShared>();
              List<String> idsStory = appShared.getIdsReadNowGuest();

              if (!idsStory.contains(storyId)) {
                idsStory.add(storyId);

                appShared.setIdsReadNowGuest(idsStory);
              }
            }

            if (storyType == StoryType.Novel) {
              bloc.add(OnNavigatePage(
                  PageCommandNavigatorPage(page: AppPages.novelChapterDetail(chapter.id))));
            } else if (storyType == StoryType.Comic) {
              bloc.add(OnNavigatePage(
                  PageCommandNavigatorPage(page: AppPages.mangaChapterDetail(chapter.id))));
            }
          },
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}, ${chapter.title}',
                      style: GoogleFonts.cabin(
                        fontSize: 14,
                        color: AppColors.secondary4,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    6.height,
                    Text(
                      LocaleKey.latestUpdate
                          .trParams({'time': AppUtils.formatUtcTime(dateUtc: chapter.updatedAt)}),
                      style: GoogleFonts.cabin(
                        fontSize: 10,
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              16.width,
              InkWell(
                  onTap: () {
                    showToast(LocaleKey.upgrading.tr);
                  },
                  child: SvgPicture.asset(AppAssets.ic_download_svg))
            ],
          ),
        );
      },
      loadMore: () => bloc.add(
        FetchChapterList(
          storyId: storyId,
          page: currentPage + 1,
          isLoadMore: true,
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => Container(
        height: .8,
        width: Get.width,
        color: AppColors.black,
        margin: 12.paddingVertical,
      ),
    );
  }
}
