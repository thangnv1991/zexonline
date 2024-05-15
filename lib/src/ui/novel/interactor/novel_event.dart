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

class GetNovels extends NovelEvent {
  final int page;
  final int size;
  final bool isLoadMore;

  const GetNovels({
    this.page = 1,
    this.isLoadMore = false,
    this.size = 30,
  });

  @override
  List<Object> get props => [];
}

class GetAudios extends NovelEvent {
  final int page;
  final int size;
  final bool isLoadMore;

  const GetAudios({
    this.page = 1,
    this.isLoadMore = false,
    this.size = 30,
  });

  @override
  List<Object> get props => [];
}
