import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/ripple_button.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class StoryDetailSwitchAction extends StatelessWidget {
  const StoryDetailSwitchAction({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<StoryBloc>();
    return BlocBuilder<StoryBloc, StoryDetailState>(
        buildWhen: (previous, current) => previous.showDescription != current.showDescription,
        builder: (context, state) {
          final showDetailView = state.showDescription;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            margin: 24.paddingHorizontal,
            decoration:
                BoxDecoration(color: const Color(0xE698B4FF), borderRadius: 50.borderRadiusAll),
            child: Row(
              children: [
                Expanded(
                  child: RippleButton(
                    onTap: () => bloc.add(const OnShowDescriptionAlbum(true)),
                    title: LocaleKey.detail.tr,
                    height: 37,
                    padding: 0.paddingAll,
                    backgroundColor: showDetailView ? AppColors.black : AppColors.transparent,
                    colorTitle: !showDetailView ? AppColors.black : AppColors.secondary2,
                  ),
                ),
                12.width,
                Expanded(
                  child: RippleButton(
                    onTap: () => bloc.add(const OnShowDescriptionAlbum(false)),
                    title: LocaleKey.chapters.tr,
                    height: 37,
                    padding: 0.paddingAll,
                    fontWeight: FontWeight.w600,
                    backgroundColor: showDetailView ? AppColors.transparent : AppColors.black,
                    colorTitle: showDetailView ? AppColors.black : AppColors.secondary2,
                  ),
                )
              ],
            ),
          );
        });
  }
}
