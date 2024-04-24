import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/navigator_manager.dart';
import 'package:zexonline/src/enums/enum_sort_type.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/home/component/home_view.dart';
import 'package:zexonline/src/ui/home/interactor/home_bloc.dart';
import 'package:zexonline/src/utils/app_shared.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final appShared = Get.find<AppShared>();

    appShared.watchIdsReadNowGuest().listen((event) {
      if (event.isNotEmpty) {
        Get.find<HomeBloc>().add(const GetListStories(null));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<HomeBloc>()
        ..add(const RegisterFCM())
        ..add(const GetListStories(null))
        ..add(const GetListStories(SortType.Views))
        ..add(const GetListStories(SortType.LatestUpdate)),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.pageCommand is PageCommandNavigatorPage) {
            onNavigate(state.pageCommand as PageCommandNavigatorPage);
          }

          Get.find<HomeBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          return const HomeView();
        },
      ),
    );
  }
}

void onNavigate(PageCommandNavigatorPage page) async {
  Get.find<NavigatorManager>().navigateToPage(page.page, args: page.argument);
}
