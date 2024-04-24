import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/novel/component/novel_view.dart';
import 'package:zexonline/src/ui/novel/interactor/novel_bloc.dart';

class NovelPage extends StatelessWidget {
  const NovelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<NovelBloc>()..add(const GetGenres()),
      child: BlocConsumer<NovelBloc, NovelState>(
        listener: (context, state) {
          if (state.pageCommand is PageCommandNavigatorPage) {
            onNavigate(state.pageCommand as PageCommandNavigatorPage);
          }

          Get.find<NovelBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          return const NovelView();
        },
      ),
    );
  }
}

void onNavigate(PageCommandNavigatorPage page) async {
  Get.find<NavigatorManager>().navigateToPage(page.page, args: page.argument);
}
