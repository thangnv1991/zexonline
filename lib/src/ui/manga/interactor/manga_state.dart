part of 'manga_bloc.dart';

class MangaState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final List<StoryModel> storiesNewChapter;
  final List<StoryModel> storiesLatestUpdate;
  final List<StoryModel> storiesPopular;
  final List<StoryModel> storiesRate;

  const MangaState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.storiesNewChapter = const [],
    this.storiesLatestUpdate = const [],
    this.storiesPopular = const [],
    this.storiesRate = const [],
  });

  MangaState copyWith({
    PageState? status,
    String? error,
    PageCommand? pageCommand,
    List<StoryModel>? storiesNewChapter,
    List<StoryModel>? storiesLatestUpdate,
    List<StoryModel>? storiesPopular,
    List<StoryModel>? storiesRate,
  }) {
    return MangaState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      storiesNewChapter: storiesNewChapter ?? this.storiesNewChapter,
      storiesLatestUpdate: storiesLatestUpdate ?? this.storiesLatestUpdate,
      storiesPopular: storiesPopular ?? this.storiesPopular,
      storiesRate: storiesRate ?? this.storiesRate,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        pageCommand,
        storiesNewChapter,
        storiesLatestUpdate,
        storiesPopular,
        storiesRate,
      ];
}
