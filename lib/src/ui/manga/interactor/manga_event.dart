part of 'manga_bloc.dart';

abstract class MangaEvent extends Equatable {
  const MangaEvent();
}

class OnChangeType extends MangaEvent {
  final String type;

  const OnChangeType(this.type);

  @override
  List<Object> get props => [];
}

class OnNavigatePage extends MangaEvent {
  final PageCommandNavigatorPage page;
  const OnNavigatePage(this.page);
  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends MangaEvent {
  const OnClearPageCommand();
  @override
  List<Object> get props => [];
}

class GetGenres extends MangaEvent {
  const GetGenres();
  @override
  List<Object> get props => [];
}

class GetNovelsByGenre extends MangaEvent {
  final String genreId;
  final int? page;
  const GetNovelsByGenre(this.genreId, {this.page});
  @override
  List<Object> get props => [];
}
