part of 'library_bloc.dart';

class LibraryState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final LibraryTab currentTab;
  final List favoriteList;
  final List<StoryModel> stories;

  const LibraryState({
    required this.status,
    required this.error,
    required this.currentTab,
    this.pageCommand,
    this.favoriteList = const [],
    this.stories = const [],
  });

  LibraryState copyWith({
    PageState? status,
    String? error,
    PageCommand? pageCommand,
    LibraryTab? currentTab,
    List? favoriteList,
    List<StoryModel>? stories,
  }) {
    return LibraryState(
      status: status ?? this.status,
      error: error ?? this.error,
      currentTab: currentTab ?? this.currentTab,
      pageCommand: pageCommand,
      stories: stories ?? this.stories,
      favoriteList: favoriteList ?? this.favoriteList,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        currentTab,
        pageCommand,
        stories
      ];
}
