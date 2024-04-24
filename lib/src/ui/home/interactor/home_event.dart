part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class OnNavigatePage extends HomeEvent {
  final PageCommandNavigatorPage page;

  const OnNavigatePage(this.page);

  @override
  List<Object> get props => [];
}

class GetListStories extends HomeEvent {
  final SortType? sort;
  final int page;
  final int pageSize;

  const GetListStories(this.sort, {this.page = 1, this.pageSize = 25});

  @override
  List<Object> get props => [];
}

class RegisterFCM extends HomeEvent {
  const RegisterFCM();

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends HomeEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}
