part of 'library_bloc.dart';

class LibraryState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final LibraryTab currentTab;
  final List favoriteList;
  final List<StoryModel> stories;
  final bool isLoading;
  final bool isLoadMore;

  const LibraryState({
    required this.status,
    required this.error,
    required this.currentTab,
    this.pageCommand,
    this.favoriteList = const [],
    this.stories = const [],
    this.isLoading = true,
    this.isLoadMore = false,
  });

  LibraryState copyWith({
    PageState? status,
    String? error,
    PageCommand? pageCommand,
    LibraryTab? currentTab,
    List? favoriteList,
    List<StoryModel>? stories,
    bool? isLoading,
    bool? isLoadMore,
  }) {
    return LibraryState(
      status: status ?? this.status,
      error: error ?? this.error,
      currentTab: currentTab ?? this.currentTab,
      pageCommand: pageCommand,
      stories: stories ?? this.stories,
      favoriteList: favoriteList ?? this.favoriteList,
      isLoading: isLoading ?? this.isLoading,
      isLoadMore: isLoadMore ?? this.isLoadMore,
    );
  }

  @override
  List<Object?> get props =>
      [status, error, currentTab, pageCommand, stories, isLoading, isLoadMore];
}
