import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/story_detail/component/genera_info_widget.dart';
import 'package:zexonline/src/ui/story_detail/component/list_chapter_widget.dart';
import 'package:zexonline/src/ui/story_detail/component/story_description_view.dart';
import 'package:zexonline/src/ui/story_detail/component/story_detail_bottom_widget.dart';
import 'package:zexonline/src/ui/story_detail/component/story_detail_switch_action.dart';
import 'package:zexonline/src/ui/story_detail/interactor/story_detail_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_circular_progress.dart';
import 'package:zexonline/src/ui/widgets/common/image_widget.dart';
import 'package:zexonline/src/utils/app_assets.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_constants.dart';

class StoryDetailView extends StatefulWidget {
  const StoryDetailView({super.key});

  @override
  State<StoryDetailView> createState() => _StoryDetailViewState();
}

class _StoryDetailViewState extends State<StoryDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: BasePage(
        isBackground: false,
        child: BlocBuilder<StoryBloc, StoryDetailState>(
          buildWhen: (previous, current) => previous.story != current.story,
          builder: (context, state) {
            final StoryModel? story = state.story;
            return Scaffold(
              backgroundColor: AppColors.white,
              extendBodyBehindAppBar: true,
              body: story == null
                  ? const CustomCircularProgress()
                  : NestedScrollView(
                      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                        return [
                          SliverAppBar(
                              toolbarHeight: Get.height / 3,
                              stretch: true,
                              titleSpacing: 0,
                              leadingWidth: 0,
                              primary: false,
                              floating: true,
                              title: SizedBox(
                                height: Get.height / 3,
                                width: Get.width,
                                child: Stack(
                                  children: [
                                    ImageWidget(
                                      image: AppConstants.domainImage(story.banner),
                                      fit: BoxFit.cover,
                                      width: Get.width,
                                      height: Get.height / 3,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 20,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: 16.borderRadiusTop),
                                      ),
                                    ),
                                    SizedBox(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                        child: Container(
                                          decoration:
                                              BoxDecoration(color: Colors.white.withOpacity(0.0)),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 10,
                                      child: ImageWidget(
                                        radius: 10,
                                        image: AppConstants.domainImage(story.banner),
                                        fit: BoxFit.contain,
                                        height: 240,
                                      ),
                                    ),
                                    const Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 10,
                                      child: GeneralInfoWidget(),
                                    ),
                                    Positioned(
                                      left: 10,
                                      top: 34,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: AppColors.backgroundColor2,
                                          borderRadius: 10.borderRadiusAll,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: SvgPicture.asset(
                                            AppAssets.ic_arrow_back_svg,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ];
                      },
                      body: Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Container(
                            color: AppColors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: 10.paddingHorizontal,
                                  child: const StoryDetailSwitchAction(),
                                ),
                                12.height,
                                BlocBuilder<StoryBloc, StoryDetailState>(
                                    buildWhen: (previous, current) =>
                                        previous.showDescription != current.showDescription,
                                    builder: (context, state) {
                                      return Expanded(
                                          child: state.showDescription
                                              ? const StoryDescriptionView()
                                              : const ListChapterWidget());
                                    }),
                              ],
                            )),
                      ),
                    ),
              bottomNavigationBar: state.story == null ? 0.height : const StoryDetailBottomWidget(),
            );
          },
        ),
      ),
    );
  }
}
