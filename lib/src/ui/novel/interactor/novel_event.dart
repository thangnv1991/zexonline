part of 'novel_bloc.dart';

abstract class NovelEvent extends Equatable {
  const NovelEvent();
}

class OnChangeType extends NovelEvent {
  final int type;

  const OnChangeType(this.type);

  @override
  List<Object> get props => [];
}

class OnNavigatePage extends NovelEvent {
  final PageCommandNavigatorPage page;

  const OnNavigatePage(this.page);

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends NovelEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class GetNovelsByGenre extends NovelEvent {
  final String genreId;
  final int? page;

  const GetNovelsByGenre(this.genreId, {this.page});

  @override
  List<Object> get props => [];
}
