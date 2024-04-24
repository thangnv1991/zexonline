part of 'library_bloc.dart';

abstract class LibraryEvent extends Equatable {
  const LibraryEvent();
}

class OnChangeLibraryTab extends LibraryEvent {
  final LibraryTab tab;

  const OnChangeLibraryTab(this.tab);

  @override
  List<Object> get props => [];
}

class OnNavigatePage extends LibraryEvent {
  final PageCommandNavigatorPage page;

  const OnNavigatePage(this.page);

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends LibraryEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class GetStories extends LibraryEvent {
  final bool loadMore;
  final LibraryTab tab;
  final int page;
  final int pageSize;

  const GetStories({this.page = 1, this.pageSize = 10, this.loadMore = false, required this.tab});

  @override
  List<Object> get props => [];
}
