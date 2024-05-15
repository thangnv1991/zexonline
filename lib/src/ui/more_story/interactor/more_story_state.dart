part of 'more_story_bloc.dart';

class MoreStoryState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final List<StoryModel> stories;
  final int currentPage;
  final bool isLoadMore;
  final bool isLoading;

  const MoreStoryState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.stories = const [],
    this.currentPage = 1,
    this.isLoadMore = false,
    this.isLoading = true,
  });

  MoreStoryState copyWith({
    PageState? status,
    String? error,
    PageCommand? pageCommand,
    List<StoryModel>? stories,
    int? currentPage,
    bool? isLoadMore,
    bool? isLoading,
  }) {
    return MoreStoryState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      stories: stories ?? this.stories,
      currentPage: currentPage ?? this.currentPage,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props =>
      [status, error, pageCommand, stories, currentPage, isLoadMore, isLoading];
}
