import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/component/novel_chapter_detail_bottom_action.dart';
import 'package:zexonline/src/ui/novel_chapter_detail/interactor/novel_chapter_detail_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/ripple_button.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class NovelChapterDetailView extends StatelessWidget {
  const NovelChapterDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<NovelChapterDetailBloc>();
    return BasePage(
      isBackground: false,
      child: BlocBuilder<NovelChapterDetailBloc, NovelChapterDetailState>(
          buildWhen: (previous, current) => previous.backgroundColor != current.backgroundColor,
          builder: (context, state) {
            return Scaffold(
              backgroundColor: state.backgroundColor,
              body: BlocBuilder<NovelChapterDetailBloc, NovelChapterDetailState>(
                  buildWhen: (previous, current) =>
                      previous.fontFamily != current.fontFamily ||
                      previous.fontSize != current.fontSize ||
                      previous.chapter != current.chapter,
                  builder: (context, state) {
                    final content = state.chapter?.content ?? [];
                    return SafeArea(
                      bottom: false,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onDoubleTap: () => bloc.add(const OnHideAction(false)),
                            child: NotificationListener<ScrollStartNotification>(
                              onNotification: (notificationInfo) {
                                bloc.add(OnHideAction(
                                    notificationInfo.metrics.axisDirection == AxisDirection.down));
                                return true;
                              },
                              child: SafeArea(
                                child: ListView.builder(
                                    itemCount: content.length,
                                    cacheExtent: 5 * Get.height,
                                    padding: 16.paddingVertical,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: 16.paddingHorizontal,
                                        child: Text(
                                          content[index],
                                          style: state.fontFamily.textStyle.copyWith(
                                            fontSize: state.fontSize,
                                            color: AppColors.secondary1,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                          state.hideAction
                              ? 0.height
                              : RippleButton(
                                  onTap: () {},
                                  margin: 24.paddingHorizontal,
                                  backgroundColor: AppColors.secondary3,
                                  title: state.chapter?.title ?? '',
                                ),
                          NovelChapterDetailBottomAction(
                              chapterPrevious: state.chapter?.chapterPrevious,
                              chapterNext: state.chapter?.chapterNext),
                        ],
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
