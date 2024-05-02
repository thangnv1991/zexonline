part of 'more_story_bloc.dart';

class MoreStoryState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final List<StoryModel> stories;
  final int currentPage;

  const MoreStoryState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.stories = const [],
    this.currentPage = 1,
  });

  MoreStoryState copyWith({
    PageState? status,
    String? error,
    PageCommand? pageCommand,
    List<StoryModel>? stories,
    int? currentPage,
  }) {
    return MoreStoryState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      stories: stories ?? this.stories,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [status, error, pageCommand, stories, currentPage];
}
