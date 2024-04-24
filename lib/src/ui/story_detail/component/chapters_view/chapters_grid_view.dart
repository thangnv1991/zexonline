import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/core/model/chapter_model.dart';
import 'package:zexonline/src/enums/enum_story_type.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';
import 'package:zexonline/src/utils/app_shared.dart';
import 'package:zexonline/src/utils/app_utils.dart';

class ChaptersGridView extends StatelessWidget {
  final StoryType? storyType;
  final List<ChapterModel> chapters;
  final String? storyId;

  const ChaptersGridView(this.chapters, this.storyType, this.storyId, {super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<StoryBloc>();
    return GridView.builder(
      padding: 0.paddingAll,
      itemCount: chapters.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        final ChapterModel chapter = chapters[index];
        return GestureDetector(
          onTap: () {
            if (!AppUtils.isLogin()) {
              final appShared = Get.find<AppShared>();
              List<String> idsStory = appShared.getIdsReadNowGuest();

              if (storyId != null && !idsStory.contains(storyId)) {
                idsStory.add(storyId!);

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
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.secondary4,
              borderRadius: 4.borderRadiusAll,
            ),
            child: Center(
              child: Text(
                '${chapter.title}',
                style: GoogleFonts.cabin(
                  fontSize: 10,
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
