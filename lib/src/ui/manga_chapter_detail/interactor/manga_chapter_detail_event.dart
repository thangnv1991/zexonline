part of 'manga_chapter_detail_bloc.dart';

abstract class ChapterDetailEvent extends Equatable {
  const ChapterDetailEvent();
}

class OnShowVertical extends ChapterDetailEvent {
  final bool showVertical;

  const OnShowVertical(this.showVertical);

  @override
  List<Object> get props => [];
}

class FetchChapterDetail extends ChapterDetailEvent {
  final String? chapterId;

  const FetchChapterDetail(this.chapterId);

  @override
  List<Object?> get props => [chapterId];
}

class FetchMoreChapterDetail extends ChapterDetailEvent {
  const FetchMoreChapterDetail();

  @override
  List<Object?> get props => [];
}

class OnShowBottomNavigation extends ChapterDetailEvent {
  final bool showBottomNavigation;

  const OnShowBottomNavigation(this.showBottomNavigation);

  @override
  List<Object> get props => [];
}
