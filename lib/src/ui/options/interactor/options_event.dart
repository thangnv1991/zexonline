part of 'options_bloc.dart';

abstract class OptionsEvent extends Equatable {
  const OptionsEvent();
}

class OnChangeTabEvent extends OptionsEvent {
  final BottomNavigationPage tab;

  const OnChangeTabEvent(this.tab);

  @override
  List<Object> get props => [];
}

class OnTapOptionItem extends OptionsEvent {
  final OptionAction action;

  const OnTapOptionItem(this.action);

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends OptionsEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnGetNotice extends OptionsEvent {
  final bool getNotice;

  const OnGetNotice(this.getNotice);

  @override
  List<Object> get props => [];
}

class FetchSetting extends OptionsEvent {
  const FetchSetting();

  @override
  List<Object> get props => [];
}

class UpdateSetting extends OptionsEvent {
  final bool enableNotification;

  const UpdateSetting({required this.enableNotification});

  @override
  List<Object> get props => [enableNotification];
}
