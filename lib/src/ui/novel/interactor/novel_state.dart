part of 'novel_bloc.dart';

class NovelState extends Equatable {
  final PageState status;
  final String error;
  final int selectedTab;
  final PageCommand? pageCommand;
  final Meta? meta;
  final bool isLoadMore;
  final bool isLoading;
  final List<StoryModel> novels;
  final List<StoryModel> audio;

  const NovelState({
    required this.status,
    required this.error,
    required this.selectedTab,
    this.pageCommand,
    this.isLoadMore = false,
    this.isLoading = true,
    this.meta,
    this.novels = const [],
    this.audio = const [],
  });

  NovelState copyWith({
    PageState? status,
    String? error,
    int? selectedTab,
    PageCommand? pageCommand,
    List<Genre>? genres,
    List<StoryModel>? novels,
    List<StoryModel>? audio,
    bool? isLoadMore,
    bool? isLoading,
    Meta? meta,
  }) {
    return NovelState(
      status: status ?? this.status,
      error: error ?? this.error,
      selectedTab: selectedTab ?? this.selectedTab,
      pageCommand: pageCommand,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      novels: novels ?? this.novels,
      meta: meta ?? this.meta,
      audio: audio ?? this.audio,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        selectedTab,
        pageCommand,
        isLoadMore,
        novels,
        audio,
        isLoading,
      ];
}
