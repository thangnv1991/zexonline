import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/ui/app_webview/components/app_webview.dart';
import 'package:zexonline/src/ui/app_webview/interactor/app_webview_bloc.dart';

class AppWebViewPage extends StatelessWidget {
  const AppWebViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final typeString = Get.parameters['type'] ?? '';
    return BlocProvider(
      create: (context) => Get.find<AppWebViewBloc>()..add(InitWebView(typeString)),
      child: BlocConsumer<AppWebViewBloc, AppWebViewState>(
        listener: (BuildContext context, state) {},
        builder: (context, state) {
          return const AppWebView();
        },
      ),
    );
  }
}
