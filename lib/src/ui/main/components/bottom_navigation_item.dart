import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/enums/enum_bottom_navigation_page.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/main/interactor/main_bloc.dart';
import 'package:zexonline/src/utils/app_colors.dart';
import 'package:zexonline/src/utils/app_styles.dart';

class BottomNavigationItem extends StatelessWidget {
  final BottomNavigationPage page;

  const BottomNavigationItem(
    this.page, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) => previous.currentPage != current.currentPage,
      builder: (context, state) {
        final isActive = state.currentPage == page;
        return Container(
          constraints: BoxConstraints(minWidth: Get.width / 5),
          child: IconButton(
            onPressed: () => Get.find<MainBloc>().add(OnChangeTabEvent(page)),
            padding: 0.paddingAll,
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  page.activeIcon,
                  height: 24,
                  width: 24,
                  colorFilter: isActive
                      ? const ColorFilter.mode(AppColors.active, BlendMode.srcIn)
                      : const ColorFilter.mode(AppColors.inActive, BlendMode.srcIn),
                ),
                const SizedBox(height: 6),
                Text(
                  page.nameTab,
                  style:
                      AppStyles.fontSize12(color: isActive ? AppColors.active : AppColors.inActive),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
