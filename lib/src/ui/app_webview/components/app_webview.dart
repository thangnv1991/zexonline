import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:zexonline/src/enums/enum_webview_type.dart';
import 'package:zexonline/src/ui/app_webview/interactor/app_webview_bloc.dart';
import 'package:zexonline/src/ui/widgets/common/custom_appbar.dart';
import 'package:zexonline/src/ui/widgets/common/custom_circular_progress.dart';

class AppWebView extends StatelessWidget {
  const AppWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppWebViewBloc, AppWebViewState>(
      buildWhen: (previous, current) => previous.type != current.type,
      builder: (context, state) {
        final WebViewType? type = state.type;
        return Scaffold(
          appBar: const CustomAppBar(),
          body: state.type != null
              ? SafeArea(
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: Uri.tryParse(type!.getUrl()),
                    ),
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(verticalScrollBarEnabled: true),
                    ),
                  ),
                )
              : const Center(child: CustomCircularProgress()),
        );
      },
    );
  }
}
