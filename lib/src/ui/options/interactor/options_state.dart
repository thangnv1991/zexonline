part of 'options_bloc.dart';

class OptionsState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final bool? getNotice;
  final bool enableNotification;

  const OptionsState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.getNotice,
    this.enableNotification = false,
  });

  OptionsState copyWith({
    PageState? status,
    String? error,
    BottomNavigationPage? currentPage,
    PageCommand? pageCommand,
    bool? getNotice,
    bool? enableNotification,
  }) {
    return OptionsState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      getNotice: getNotice ?? this.getNotice,
      enableNotification: enableNotification ?? this.enableNotification,
    );
  }

  @override
  List<Object?> get props => [status, error, pageCommand, getNotice, enableNotification];
}
