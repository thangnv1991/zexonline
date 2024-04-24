part of 'app_webview_bloc.dart';

abstract class AppWebViewEvent extends Equatable {
  const AppWebViewEvent();
}

class InitWebView extends AppWebViewEvent {
  final String typeString;
  const InitWebView(this.typeString);

  @override
  List<Object> get props => [];
}
