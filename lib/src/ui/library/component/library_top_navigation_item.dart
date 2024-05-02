import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/enums/enum_library_tab.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/ui/library/interactor/library_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/ripple_button.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class LibraryTopNavigationItem extends StatelessWidget {
  final LibraryTab tab;

  const LibraryTopNavigationItem(
    this.tab, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      buildWhen: (previous, current) => previous.currentTab != current.currentTab,
      builder: (context, state) {
        bool isActive = state.currentTab == tab;
        return Expanded(
          child: Container(
            margin: 2.paddingAll,
            decoration: BoxDecoration(
              borderRadius: 50.borderRadiusAll,
            ),
            child: RippleButton(
              onTap: () => Get.find<LibraryBloc>().add(OnChangeLibraryTab(tab)),
              title: tab.tabName,
              colorTitle: isActive ? AppColors.black : AppColors.secondary2,
              backgroundColor: isActive ? AppColors.secondary2 : AppColors.black,
              padding: 0.paddingAll,
            ),
          ),
        );
      },
    );
  }
}
