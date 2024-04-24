import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zexonline/src/enums/enum_webview_type.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';

part 'app_webview_event.dart';
part 'app_webview_state.dart';

class AppWebViewBloc extends Bloc<AppWebViewEvent, AppWebViewState> {
  AppWebViewBloc() : super(const AppWebViewState(error: '', status: PageState.loading)) {
    on<InitWebView>(_initWebView);
  }

  FutureOr<void> _initWebView(InitWebView event, Emitter<AppWebViewState> emit) {
    emit(state.copyWith(type: getWebViewType(event.typeString)));
  }
}
