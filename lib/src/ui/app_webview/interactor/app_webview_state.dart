part of 'app_webview_bloc.dart';

class AppWebViewState extends Equatable {
  final PageState status;
  final String error;
  final WebViewType? type;

  const AppWebViewState({
    required this.status,
    required this.error,
    this.type,
  });

  AppWebViewState copyWith({
    PageState? status,
    String? error,
    WebViewType? type,
  }) {
    return AppWebViewState(
      status: status ?? this.status,
      error: error ?? this.error,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        type,
      ];
}
