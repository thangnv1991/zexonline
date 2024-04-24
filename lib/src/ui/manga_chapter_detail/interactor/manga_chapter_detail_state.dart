part of 'manga_chapter_detail_bloc.dart';

class MangaChapterDetailState extends Equatable {
  final PageState status;
  final String error;
  final bool showVertical;
  final PageCommand? pageCommand;
  final ChapterModel? chapter;
  final int loadedItemCount;
  final int pageSize;
  final List<String> contentPaging;
  final bool showBottomNavigation;
  final bool isLoadMore;

  const MangaChapterDetailState({
    required this.status,
    required this.error,
    this.showVertical = true,
    this.chapter,
    this.pageCommand,
    this.showBottomNavigation = true,
    this.loadedItemCount = 0,
    this.pageSize = 4,
    this.contentPaging = const [],
    this.isLoadMore = false,
  });

  MangaChapterDetailState copyWith({
    PageState? status,
    String? error,
    bool? showVertical,
    PageCommand? pageCommand,
    ChapterModel? chapter,
    bool? showBottomNavigation,
    int? loadedItemCount,
    int? pageSize,
    List<String>? contentPaging,
    bool? isLoadMore,
  }) {
    return MangaChapterDetailState(
      status: status ?? this.status,
      error: error ?? this.error,
      showVertical: showVertical ?? this.showVertical,
      pageCommand: pageCommand ?? this.pageCommand,
      chapter: chapter ?? this.chapter,
      showBottomNavigation: showBottomNavigation ?? this.showBottomNavigation,
      loadedItemCount: loadedItemCount ?? this.loadedItemCount,
      pageSize: pageSize ?? this.pageSize,
      contentPaging: contentPaging ?? this.contentPaging,
      isLoadMore: isLoadMore ?? this.isLoadMore,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        showVertical,
        pageCommand,
        chapter,
        showBottomNavigation,
        loadedItemCount,
        pageSize,
        contentPaging,
        isLoadMore
      ];
}
