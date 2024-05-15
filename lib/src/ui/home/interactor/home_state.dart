part of 'home_bloc.dart';

class HomeState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final List<StoryModel> topManga;
  final List<StoryModel> latestUpdate;
  final List<StoryModel> nowReading;
  final bool loadingTopManga;
  final bool loadingLatestUpdate;
  final bool loadingNowReading;

  const HomeState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.topManga = const [],
    this.latestUpdate = const [],
    this.nowReading = const [],
    this.loadingTopManga = true,
    this.loadingLatestUpdate = true,
    this.loadingNowReading = true,
  });

  HomeState copyWith({
    PageState? status,
    String? error,
    PageCommand? pageCommand,
    List<StoryModel>? topManga,
    List<StoryModel>? latestUpdate,
    List<StoryModel>? nowReading,
    bool? loadingTopManga,
    bool? loadingLatestUpdate,
    bool? loadingNowReading,
  }) {
    return HomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      topManga: topManga ?? this.topManga,
      latestUpdate: latestUpdate ?? this.latestUpdate,
      nowReading: nowReading ?? this.nowReading,
      loadingTopManga: loadingTopManga ?? this.loadingTopManga,
      loadingLatestUpdate: loadingLatestUpdate ?? this.loadingLatestUpdate,
      loadingNowReading: loadingNowReading ?? this.loadingNowReading,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        pageCommand,
        topManga,
        latestUpdate,
        nowReading,
        loadingTopManga,
        loadingLatestUpdate,
        loadingNowReading,
      ];
}
