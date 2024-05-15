part of 'story_detail_bloc.dart';

abstract class StoryDetailEvent extends Equatable {
  const StoryDetailEvent();
}

class Init extends StoryDetailEvent {
  final String storyId;

  const Init({required this.storyId});

  @override
  List<Object> get props => [storyId];
}

class OnChangeType extends StoryDetailEvent {
  final String type;

  const OnChangeType(this.type);

  @override
  List<Object> get props => [];
}

class OnChangeViewChapterType extends StoryDetailEvent {
  final bool gridView;

  const OnChangeViewChapterType(this.gridView);

  @override
  List<Object> get props => [];
}

class OnShowDescriptionAlbum extends StoryDetailEvent {
  final bool showDescription;

  const OnShowDescriptionAlbum(this.showDescription);

  @override
  List<Object> get props => [];
}

class OnNavigatePage extends StoryDetailEvent {
  final PageCommandNavigatorPage page;

  const OnNavigatePage(this.page);

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends StoryDetailEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnFavoriteStory extends StoryDetailEvent {
  final String storyId;

  const OnFavoriteStory({required this.storyId});

  @override
  List<Object> get props => [storyId];
}

class OnReadNow extends StoryDetailEvent {
  const OnReadNow();

  @override
  List<Object> get props => [];
}

class FetchChapterList extends StoryDetailEvent {
  final String storyId;
  final bool isLoadMore;
  final int page;

  const FetchChapterList({
    required this.storyId,
    this.isLoadMore = false,
    this.page = 0,
  });

  @override
  List<Object> get props => [storyId];
}
