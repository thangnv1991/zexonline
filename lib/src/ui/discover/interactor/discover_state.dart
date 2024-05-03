part of 'discover_bloc.dart';

class DiscoverState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final List<Genre> genres;
  final Genre? selectedGenre;
  final SortType selectedSortType;
  final List<StoryModel> stories;
  final String keySearch;
  final Genre? genreSelected;
  final Meta? meta;
  final bool isLoadMore;
  final int selectedTab;

  const DiscoverState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.genres = const [],
    this.selectedGenre,
    this.selectedSortType = SortType.LatestUpdate,
    this.stories = const [],
    this.keySearch = '',
    this.meta,
    this.isLoadMore = false,
    this.selectedTab = 0,
    this.genreSelected,
  });

  DiscoverState copyWith({
    PageState? status,
    String? error,
    PageCommand? pageCommand,
    SortType? sortType,
    List<Genre>? genres,
    Genre? selectedGenre,
    SortType? selectedSortType,
    List<StoryModel>? stories,
    String? keySearch,
    Meta? meta,
    bool? isLoadMore,
    int? selectedTab,
    Genre? genreSelected,
  }) {
    return DiscoverState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      genres: genres ?? this.genres,
      selectedGenre: selectedGenre ?? this.selectedGenre,
      selectedSortType: selectedSortType ?? this.selectedSortType,
      stories: stories ?? this.stories,
      keySearch: keySearch ?? this.keySearch,
      meta: meta ?? this.meta,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      selectedTab: selectedTab ?? this.selectedTab,
      genreSelected: genreSelected ?? this.genreSelected,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        pageCommand,
        genres,
        selectedSortType,
        selectedGenre,
        stories,
        keySearch,
        meta,
        isLoadMore,
        selectedTab,
        genreSelected
      ];
}
