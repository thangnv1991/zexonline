import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/enums/enum_sort_type.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/more_story/interactor/more_story_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/ui/widgets/common/custom_listview.dart';
import 'package:zexonline/src/ui/widgets/horizontal_item.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_pages.dart';

class MoreStoryPage extends StatelessWidget {
  const MoreStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final type = Get.arguments as SortType;
    return BlocProvider(
      create: (context) => Get.find<MoreStoryBloc>()..add(GetListStories(type)),
      child: BlocConsumer<MoreStoryBloc, MoreStoryState>(
        listener: (context, state) {
          Get.find<MoreStoryBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          return BasePage(
            isBackground: false,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: CustomAppBar(
                  backgroundColor: AppColors.white,
                  title: type.title,
                  implyLeading: true,
                  actions: [
                    IconButton(
                      onPressed: () =>
                          Get.find<NavigatorManager>().navigateToPage(AppPages.discover),
                      icon: Container(
                          padding: 3.paddingAll,
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.search,
                            color: AppColors.primary,
                          )),
                    )
                  ]),
              body: Padding(
                padding: 16.paddingAll,
                child: CustomListView(
                    itemCount: state.stories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HorizontalItem(
                        story: state.stories[index],
                        onNavigateToDetail: () {
                          Get.find<NavigatorManager>()
                              .navigateToPage(AppPages.storyDetail(state.stories[index].id!));
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return 10.height;
                    },
                    loadMore: () {
                      Get.find<MoreStoryBloc>().add(GetListStories(
                        type,
                        page: state.currentPage + 1,
                      ));
                    },
                    refresh: () async {
                      Get.find<MoreStoryBloc>().add(GetListStories(type));
                    }),
              ),
            ),
          );
        },
      ),
    );
  }
}
