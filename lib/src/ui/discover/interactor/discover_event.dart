part of 'discover_bloc.dart';

abstract class DiscoverEvent extends Equatable {
  const DiscoverEvent();
}

class Init extends DiscoverEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class OnShowBottomSheet extends DiscoverEvent {
  final PageCommandShowBottomSheet? bottomSheet;

  const OnShowBottomSheet(this.bottomSheet);

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends DiscoverEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnNavigatePage extends DiscoverEvent {
  final PageCommandNavigatorPage page;

  const OnNavigatePage(this.page);

  @override
  List<Object> get props => [];
}

class OnSearchStories extends DiscoverEvent {
  final int? page;
  final Genre? genre;
  final SortType? sortType;

  const OnSearchStories({
    this.page,
    this.genre,
    this.sortType,
  });

  @override
  List<Object> get props => [];
}

class OnChangeKeySearch extends DiscoverEvent {
  final String keySearch;

  const OnChangeKeySearch(this.keySearch);

  @override
  List<Object> get props => [keySearch];
}

class OnClearSelectedGenre extends DiscoverEvent {
  const OnClearSelectedGenre();
  @override
  List<Object> get props => [];
}
