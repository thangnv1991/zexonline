part of 'story_detail_bloc.dart';

class StoryDetailState extends Equatable {
  final PageState status;
  final String error;
  final String selectedType;
  final bool gridView;
  final bool showDescription;
  final PageCommand? pageCommand;
  final StoryModel? story;
  final String? id;
  final List<ChapterModel> chapters;
  final bool isLoadMore;
  final int currentPage;

  const StoryDetailState({
    required this.status,
    required this.error,
    required this.selectedType,
    this.gridView = false,
    this.showDescription = true,
    this.pageCommand,
    this.story,
    this.id,
    this.chapters = const [],
    this.isLoadMore = false,
    this.currentPage = 0,
  });

  StoryDetailState copyWith({
    PageState? status,
    String? error,
    String? selectedType,
    bool? gridView,
    bool? showDescription,
    PageCommand? pageCommand,
    StoryModel? story,
    String? id,
    List<ChapterModel>? chapters,
    bool? isLoadMore,
    int? currentPage,
  }) {
    return StoryDetailState(
      status: status ?? this.status,
      error: error ?? this.error,
      selectedType: selectedType ?? this.selectedType,
      gridView: gridView ?? this.gridView,
      showDescription: showDescription ?? this.showDescription,
      pageCommand: pageCommand,
      story: story ?? this.story,
      id: id ?? this.id,
      chapters: chapters ?? this.chapters,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        selectedType,
        gridView,
        showDescription,
        pageCommand,
        story,
        id,
        chapters,
        isLoadMore
      ];
}
