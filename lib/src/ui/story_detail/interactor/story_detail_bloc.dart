import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zexonline/src/core/model/chapter_model.dart';
import 'package:zexonline/src/core/model/response/chapter_list_response.dart';
import 'package:zexonline/src/core/model/response/story_detail_response.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/core/repository/story_repository.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/utils/app_demo_data.dart';
import 'package:zexonline/src/utils/app_utils.dart';

part 'story_detail_event.dart';
part 'story_detail_state.dart';

class StoryBloc extends Bloc<StoryDetailEvent, StoryDetailState> {
  final StoryRepository _storyRepository = StoryRepository();

  StoryBloc()
      : super(StoryDetailState(error: '', status: PageState.loading, selectedType: novelTypes[0])) {
    on<Init>(_init);
    on<OnFavoriteStory>(_onFavoriteStory);
    on<FetchChapterList>(_fetchChapterList);
    on<OnChangeType>((event, emit) => emit(state.copyWith(selectedType: event.type)));
    on<OnChangeViewChapterType>((event, emit) => emit(state.copyWith(gridView: !event.gridView)));

    on<OnShowDescriptionAlbum>(
        (event, emit) => emit(state.copyWith(showDescription: event.showDescription)));
    on<OnNavigatePage>((event, emit) => emit(state.copyWith(pageCommand: event.page)));
    on<OnClearPageCommand>((_, emit) => emit(state.copyWith(pageCommand: null)));
  }

  FutureOr _init(Init event, emit) async {
    try {
      final StoryDetailResponse result = await _storyRepository.getStoryDetail(event.storyId);

      emit(state.copyWith(story: result.data, status: PageState.success, id: event.storyId));
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure));
    }
  }

  FutureOr _onFavoriteStory(OnFavoriteStory event, emit) async {
    try {
      if (!AppUtils.isLogin()) {
        return;
      }

      !state.story!.isFavorite
          ? await _storyRepository.postFavoriteStory(event.storyId)
          : await _storyRepository.postUnFavoriteStory(event.storyId);

      emit(state.copyWith(
          status: PageState.success,
          story: state.story!.copyWith(isFavorite: !state.story!.isFavorite)));
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure));
    }
  }

  FutureOr _fetchChapterList(FetchChapterList event, emit) async {
    try {
      final ChapterListResponse result = await _storyRepository.getChapterList(event.storyId);

      emit(state.copyWith(status: PageState.success, chapters: result.data ?? []));
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure));
    }
  }
}
