import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/enums/enum_sheet_type.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/component/bottom_sheet/novel_setting_bottom_sheet.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/component/novel_chapter_detail_view.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/interactor/novel_chapter_detail_bloc.dart';
import 'package:zexonline/src/utils/app_constants.dart';

class NovelChapterDetailPage extends StatelessWidget {
  const NovelChapterDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'];
    return BlocProvider(
      create: (context) => Get.find<NovelChapterDetailBloc>()
        ..add(const Init())
        ..add(FetchChapterDetail(id)),
      child: BlocConsumer<NovelChapterDetailBloc, NovelChapterDetailState>(
        listener: (context, state) {
          if (state.pageCommand is PageCommandShowBottomSheet) {
            onShowBottomSheet(state.pageCommand as PageCommandShowBottomSheet);
          }

          Get.find<NovelChapterDetailBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          return const NovelChapterDetailView();
        },
      ),
    );
  }
}

void onShowBottomSheet(PageCommandShowBottomSheet page) async {
  if (Get.isBottomSheetOpen == true) return;
  if (page.sheetType == SheetType.NovelSetting) {
    Get.bottomSheet(
      const NovelSettingBottomSheet(),
      shape: AppConstants.bottomSheetBorder,
      barrierColor: Colors.black26,
    );
  }
}
