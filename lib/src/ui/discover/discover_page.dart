import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/enums/enum_sheet_type.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/discover/component/bottom_sheet/category_bottom_sheet.dart';
import 'package:zexonline/src/ui/discover/component/bottom_sheet/sort_by_bottom_sheet.dart';
import 'package:zexonline/src/ui/discover/component/discover_view.dart';
import 'package:zexonline/src/ui/discover/interactor/discover_bloc.dart';
import 'package:zexonline/src/utils/app_constants.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<DiscoverBloc>()..add(const GetGenres()),
      child: BlocConsumer<DiscoverBloc, DiscoverState>(
        listener: (context, state) {
          if (state.pageCommand is PageCommandShowBottomSheet) {
            onShowBottomSheet(state.pageCommand as PageCommandShowBottomSheet);
          }
          if (state.pageCommand is PageCommandNavigatorPage) {
            onNavigate(state.pageCommand as PageCommandNavigatorPage);
          }

          Get.find<DiscoverBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          return const DiscoverView();
        },
      ),
    );
  }
}

void onShowBottomSheet(PageCommandShowBottomSheet page) async {
  final bloc = Get.find<DiscoverBloc>();
  if (Get.isBottomSheetOpen == true) return;
  if (page.sheetType == SheetType.Category) {
    Get.bottomSheet(
      CategoryBottomSheet(
        onSelectedGenre: (genre) => bloc.add(OnSearchStories(genre: genre, page: 1)),
      ),
      shape: AppConstants.bottomSheetBorder,
      barrierColor: Colors.black26,
    );
  } else if (page.sheetType == SheetType.SortBy) {
    Get.bottomSheet(
      SortByBottomSheet(
        onSelectedSortType: (sortType) => bloc.add(OnSearchStories(sortType: sortType, page: 1)),
      ),
      shape: AppConstants.bottomSheetBorder,
      barrierColor: Colors.black26,
    );
  }
}

void onNavigate(PageCommandNavigatorPage page) async {
  Get.find<NavigatorManager>().navigateToPage(page.page, args: page.argument);
}
