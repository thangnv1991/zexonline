import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/extensions/int_extensions.dart';
import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/base/base_page.dart';
import 'package:zexonline/src/ui/library/component/library_manga_grid_view.dart';
import 'package:zexonline/src/ui/library/component/library_top_navigationbar.dart';
import 'package:zexonline/src/ui/library/interactor/library_bloc.dart';
import 'package:zexonline/src/ui/widgets/base/app_body.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(builder: (context, state) {
      return BasePage(
        isBackground: false,
        child: Scaffold(
            backgroundColor: AppColors.white,
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
              implyLeading: false,
              title: LocaleKey.library.tr,
              backgroundColor: AppColors.white,
            ),
            body: Padding(
              padding: 15.paddingHorizontal,
              child: Column(
                children: [
                  const SizedBox(height: kToolbarHeight + 24),
                  const LibraryTopNavigationBar(),
                  20.height,
                  Expanded(
                    child: AppBody(pageState: state.status, success: const LibraryMangaGridView()),
                  ),
                ],
              ),
            )),
      );
    });
  }
}
