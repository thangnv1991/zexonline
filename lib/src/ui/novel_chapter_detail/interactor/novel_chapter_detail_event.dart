part of 'novel_chapter_detail_bloc.dart';

abstract class NovelDetailEvent extends Equatable {
  const NovelDetailEvent();
}

class Init extends NovelDetailEvent {
  const Init();

  @override
  List<Object?> get props => [];
}

class FetchChapterDetail extends NovelDetailEvent {
  final String? chapterId;

  const FetchChapterDetail(this.chapterId);

  @override
  List<Object?> get props => [chapterId];
}

class OnHideAction extends NovelDetailEvent {
  final bool hideAction;

  const OnHideAction(this.hideAction);

  @override
  List<Object> get props => [];
}

class OnShowBottomSheet extends NovelDetailEvent {
  final PageCommandShowBottomSheet bottomSheet;

  const OnShowBottomSheet(this.bottomSheet);

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends NovelDetailEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnChangeViewStyle extends NovelDetailEvent {
  final double? fontSize;
  final FontFamily? fontFamily;
  final Color? color;

  const OnChangeViewStyle({
    this.fontFamily,
    this.fontSize,
    this.color,
  });

  @override
  List<Object> get props => [];
}
