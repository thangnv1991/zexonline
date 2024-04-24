import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/enums/enum_library_tab.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/library/component/library_view.dart';
import 'package:zexonline/src/ui/library/interactor/library_bloc.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<LibraryBloc>()..add(const GetStories(tab: LibraryTab.History)),
      child: BlocConsumer<LibraryBloc, LibraryState>(
        listener: (context, state) {
          if (state.pageCommand is PageCommandNavigatorPage) {
            onNavigate(state.pageCommand as PageCommandNavigatorPage);
          }

          Get.find<LibraryBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          return const LibraryView();
        },
      ),
    );
  }
}

void onNavigate(PageCommandNavigatorPage page) async {
  Get.find<NavigatorManager>().navigateToPage(page.page, args: page.argument);
}
