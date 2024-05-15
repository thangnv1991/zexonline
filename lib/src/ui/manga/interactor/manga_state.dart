part of 'manga_bloc.dart';

class MangaState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final List<StoryModel> storiesNewChapter;
  final List<StoryModel> storiesLatestUpdate;
  final List<StoryModel> storiesPopular;
  final List<StoryModel> storiesRate;
  final bool loadingNewChapter;
  final bool loadingLatestUpdate;
  final bool loadingPopular;
  final bool loadingRate;

  const MangaState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.storiesNewChapter = const [],
    this.storiesLatestUpdate = const [],
    this.storiesPopular = const [],
    this.storiesRate = const [],
    this.loadingNewChapter = true,
    this.loadingLatestUpdate = true,
    this.loadingPopular = true,
    this.loadingRate = true,
  });

  MangaState copyWith({
    PageState? status,
    String? error,
    PageCommand? pageCommand,
    List<StoryModel>? storiesNewChapter,
    List<StoryModel>? storiesLatestUpdate,
    List<StoryModel>? storiesPopular,
    List<StoryModel>? storiesRate,
    bool? loadingNewChapter,
    bool? loadingLatestUpdate,
    bool? loadingPopular,
    bool? loadingRate,
  }) {
    return MangaState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      storiesNewChapter: storiesNewChapter ?? this.storiesNewChapter,
      storiesLatestUpdate: storiesLatestUpdate ?? this.storiesLatestUpdate,
      storiesPopular: storiesPopular ?? this.storiesPopular,
      storiesRate: storiesRate ?? this.storiesRate,
      loadingNewChapter: loadingNewChapter ?? this.loadingNewChapter,
      loadingLatestUpdate: loadingLatestUpdate ?? this.loadingLatestUpdate,
      loadingPopular: loadingPopular ?? this.loadingPopular,
      loadingRate: loadingRate ?? this.loadingRate,
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
        loadingNewChapter,
        loadingLatestUpdate,
        loadingPopular,
        loadingRate
      ];
}
