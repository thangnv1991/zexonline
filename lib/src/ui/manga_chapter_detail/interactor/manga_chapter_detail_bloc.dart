import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zexonline/src/core/model/chapter_model.dart';
import 'package:zexonline/src/core/model/response/chapter_detail_response.dart';
import 'package:zexonline/src/core/repository/story_repository.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';

part 'manga_chapter_detail_event.dart';
part 'manga_chapter_detail_state.dart';

class MangaChapterDetailBloc extends Bloc<ChapterDetailEvent, MangaChapterDetailState> {
  final StoryRepository _storyRepository = StoryRepository();

  MangaChapterDetailBloc()
      : super(const MangaChapterDetailState(error: '', status: PageState.loading)) {
    on<FetchChapterDetail>(_fetchChapterDetail);
    on<FetchMoreChapterDetail>(_fetchMoreChapterDetail);
    on<OnShowVertical>((event, emit) => emit(state.copyWith(showVertical: event.showVertical)));
    on<OnShowBottomNavigation>(
        (event, emit) => emit(state.copyWith(showBottomNavigation: event.showBottomNavigation)));
  }

  FutureOr<void> _fetchChapterDetail(
      FetchChapterDetail event, Emitter<MangaChapterDetailState> emit) async {
    try {
      if (event.chapterId == null) return;

      final ChapterDetailResponse result =
          await _storyRepository.getChapterDetail(event.chapterId!);

      List<String> contentPaging = [];
      if (result.data != null && result.data?.content != null) {
        contentPaging.addAll(result.data!.content!.take(4).toList());
      }

      emit(state.copyWith(
          loadedItemCount: 4,
          chapter: result.data,
          status: PageState.success,
          contentPaging: contentPaging));
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure));
    }
  }

  FutureOr<void> _fetchMoreChapterDetail(
      FetchMoreChapterDetail event, Emitter<MangaChapterDetailState> emit) async {
    try {
      if (state.isLoadMore) return;

      emit(state.copyWith(isLoadMore: true));

      await Future.delayed(const Duration(milliseconds: 500));

      final lengthContent = state.chapter?.content?.length ?? 0;
      int loadedItemCount = state.loadedItemCount;
      if (loadedItemCount >= lengthContent) {
        return;
      }

      print("Load more $loadedItemCount");

      int startIndex = loadedItemCount;
      int endIndex = startIndex + state.pageSize;
      if (endIndex > lengthContent) {
        endIndex = lengthContent;
      }

      List<String> contentPaging = state.chapter?.content?.sublist(startIndex, endIndex) ?? [];

      loadedItemCount += contentPaging.length;

      emit(state.copyWith(
        status: PageState.success,
        loadedItemCount: loadedItemCount,
        contentPaging: [...state.contentPaging, ...contentPaging],
        isLoadMore: false,
      ));
    } catch (ex) {
      emit(state.copyWith(isLoadMore: false));
    }
  }
}
