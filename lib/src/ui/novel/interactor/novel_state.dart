part of 'novel_bloc.dart';

class NovelState extends Equatable {
  final PageState status;
  final String error;
  final int selectedTab;
  final PageCommand? pageCommand;
  final List<Genre> genres;
  final Map<String, List<StoryModel>> novelsByGenre;
  final Map<String, Meta?> metaByGenre;
  final bool isLoadMore;

  const NovelState({
    required this.status,
    required this.error,
    required this.selectedTab,
    this.pageCommand,
    this.genres = const [],
    this.novelsByGenre = const {},
    this.metaByGenre = const {},
    this.isLoadMore = false,
  });

  NovelState copyWith({
    PageState? status,
    String? error,
    int? selectedTab,
    PageCommand? pageCommand,
    List<Genre>? genres,
    Map<String, List<StoryModel>>? novelsByGenre,
    Map<String, Meta?>? metaByGenre,
    bool? isLoadMore,
  }) {
    return NovelState(
      status: status ?? this.status,
      error: error ?? this.error,
      selectedTab: selectedTab ?? this.selectedTab,
      pageCommand: pageCommand,
      genres: genres ?? this.genres,
      novelsByGenre: novelsByGenre ?? this.novelsByGenre,
      metaByGenre: metaByGenre ?? this.metaByGenre,
      isLoadMore: isLoadMore ?? this.isLoadMore,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        selectedTab,
        pageCommand,
        genres,
        novelsByGenre,
        metaByGenre,
        isLoadMore,
      ];
}
