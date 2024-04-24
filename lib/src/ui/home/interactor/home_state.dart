part of 'home_bloc.dart';

class HomeState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final List<StoryModel> topManga;
  final List<StoryModel> latestUpdate;
  final List<StoryModel> nowReading;

  const HomeState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.topManga = const [],
    this.latestUpdate = const [],
    this.nowReading = const [],
  });

  HomeState copyWith({
    PageState? status,
    String? error,
    PageCommand? pageCommand,
    List<StoryModel>? topManga,
    List<StoryModel>? latestUpdate,
    List<StoryModel>? nowReading,
  }) {
    return HomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      topManga: topManga ?? this.topManga,
      latestUpdate: latestUpdate ?? this.latestUpdate,
      nowReading: nowReading ?? this.nowReading,
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
      ];
}
