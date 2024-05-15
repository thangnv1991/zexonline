import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Scaffold(
                backgroundColor: AppColors.white,
                extendBodyBehindAppBar: true,
                body: story == null
                    ? const CustomCircularProgress(
                        color: Colors.white,
                      )
                    : NestedScrollView(
                        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                          return [
                            SliverAppBar(
                                toolbarHeight: Get.height / 3,
                                stretch: true,
                                titleSpacing: 0,
                                leadingWidth: 0,
                                title: SizedBox(
                                  height: Get.height / 3,
                                  width: Get.width,
                                  child: Stack(
                                    children: [
                                      ImageWidget(
                                        image: AppConstants.domainImage(story.banner),
                                        fit: BoxFit.fitHeight,
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
                                        left: 60,
                                        bottom: 0,
                                        child: ClipRRect(
                                          borderRadius: 4.borderRadiusAll,
                                          child: ImageWidget(
                                            image: AppConstants.domainImage(story.banner),
                                            fit: BoxFit.fitHeight,
                                            height: 140,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: SvgPicture.asset(
                                          AppAssets.ic_arrow_left_svg,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                          ];
                        },
                        body: SafeArea(
                          child: Container(
                              color: AppColors.white,
                              padding: 12.paddingHorizontal,
                              child: Column(
                                children: [
                                  const GeneralInfoWidget(),
                                  12.height,
                                  const StoryDetailSwitchAction(),
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
                bottomNavigationBar:
                    state.story == null ? 0.height : const StoryDetailBottomWidget(),
              ),
            );
          },
        ),
      ),
    );
  }
}
