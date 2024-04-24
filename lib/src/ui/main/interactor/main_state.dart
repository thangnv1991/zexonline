part of 'main_bloc.dart';

class MainState extends Equatable {
  final PageState status;
  final String error;
  final BottomNavigationPage currentPage;
  final List<Genre> genres;

  const MainState(
      {required this.status,
      required this.error,
      this.currentPage = BottomNavigationPage.Home,
      this.genres = const []});

  MainState copyWith({
    PageState? status,
    String? error,
    BottomNavigationPage? currentPage,
    List<Genre>? genres,
  }) {
    return MainState(
      status: status ?? this.status,
      error: error ?? this.error,
      currentPage: currentPage ?? this.currentPage,
      genres: genres ?? this.genres,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        currentPage,
        genres,
      ];
}
