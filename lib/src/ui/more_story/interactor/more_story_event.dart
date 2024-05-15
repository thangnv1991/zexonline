part of 'more_story_bloc.dart';

abstract class MoreStoryEvent extends Equatable {
  const MoreStoryEvent();
}

class OnChangeType extends MoreStoryEvent {
  final String type;

  const OnChangeType(this.type);

  @override
  List<Object> get props => [];
}

class OnNavigatePage extends MoreStoryEvent {
  final PageCommandNavigatorPage page;

  const OnNavigatePage(this.page);

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends MoreStoryEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class GetListStories extends MoreStoryEvent {
  final SortType sort;
  final int page;
  final int pageSize;
  final bool isLoadMore;

  const GetListStories(this.sort, {this.page = 1, this.pageSize = 10, this.isLoadMore = false});

  @override
  List<Object> get props => [];
}

class GetNovelsByGenre extends MoreStoryEvent {
  final String genreId;
  final int? page;

  const GetNovelsByGenre(this.genreId, {this.page});

  @override
  List<Object> get props => [];
}
