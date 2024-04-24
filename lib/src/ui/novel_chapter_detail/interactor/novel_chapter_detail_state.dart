part of 'novel_chapter_detail_bloc.dart';

class NovelChapterDetailState extends Equatable {
  final PageState status;
  final String error;
  final bool hideAction;
  final PageCommand? pageCommand;
  final ChapterModel? chapter;
  final Color backgroundColor;
  final double fontSize;
  final FontFamily fontFamily;

  const NovelChapterDetailState({
    required this.status,
    required this.error,
    this.hideAction = false,
    this.pageCommand,
    this.chapter,
    required this.fontFamily,
    this.fontSize = 15,
    this.backgroundColor = Colors.white,
  });

  NovelChapterDetailState copyWith({
    PageState? status,
    String? error,
    bool? hideAction,
    PageCommand? pageCommand,
    ChapterModel? chapter,
    Color? backgroundColor,
    double? fontSize,
    FontFamily? fontFamily,
  }) {
    return NovelChapterDetailState(
      status: status ?? this.status,
      error: error ?? this.error,
      hideAction: hideAction ?? this.hideAction,
      pageCommand: pageCommand,
      chapter: chapter ?? this.chapter,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fontSize: fontSize ?? this.fontSize,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        hideAction,
        pageCommand,
        chapter,
        fontSize,
        fontFamily,
        backgroundColor,
      ];
}
