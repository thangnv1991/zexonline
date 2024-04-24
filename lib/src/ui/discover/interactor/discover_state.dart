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
  final Meta? meta;
  final bool isLoadMore;

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
      ];
}
