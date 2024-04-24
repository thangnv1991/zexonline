part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class OnChangeTabEvent extends MainEvent {
  final BottomNavigationPage tab;

  const OnChangeTabEvent(this.tab);

  @override
  List<Object> get props => [];
}

class GetGenres extends MainEvent {
  const GetGenres();

  @override
  List<Object> get props => [];
}
