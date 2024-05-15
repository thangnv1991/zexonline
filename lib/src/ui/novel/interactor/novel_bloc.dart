import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zexonline/src/core/model/genre.dart';
import 'package:zexonline/src/core/model/request/story_request.dart';
import 'package:zexonline/src/core/model/response/meta.dart';
import 'package:zexonline/src/core/model/response/stories_response.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/core/repository/story_repository.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';

part 'novel_event.dart';
part 'novel_state.dart';

class NovelBloc extends Bloc<NovelEvent, NovelState> {
  NovelBloc() : super(const NovelState(error: '', status: PageState.success, selectedTab: 0)) {
    on<OnChangeType>(_onChangeType);
    on<OnNavigatePage>((event, emit) => emit(state.copyWith(pageCommand: event.page)));
    on<OnClearPageCommand>((_, emit) => emit(state.copyWith(pageCommand: null)));
    on<GetNovels>(_getNovels);
    on<GetAudios>(_getAudios);
  }

  final StoryRepository _storyRepository = StoryRepository();

  FutureOr _onChangeType(OnChangeType event, emit) async {
    emit(state.copyWith(
      selectedTab: event.type,
      status: PageState.loading,
      isLoadMore: false,
    ));

    if (event.type == 0) {
      add(const GetNovels());
    } else {
      add(const GetAudios());
    }
  }

  FutureOr _getNovels(GetNovels event, emit) async {
    try {
      if (event.isLoadMore) {
        if (state.isLoadMore) return;
        emit(state.copyWith(isLoadMore: true));
      }

      final StoriesResponse result = await _storyRepository
          .getStories(StoryRequest(type: 'story', page: event.page, limit: event.size));

      emit(state.copyWith(
        novels: result.data,
        status: PageState.success,
        meta: result.meta,
        isLoadMore: false,
      ));
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure, isLoadMore: false));
    }
  }

  FutureOr _getAudios(GetAudios event, Emitter<NovelState> emit) async {
    try {
      if (state.isLoadMore) return;
      emit(state.copyWith(isLoadMore: true));

      final StoriesResponse result = await _storyRepository
          .getStories(StoryRequest(type: 'audio', page: event.page, limit: event.size));

      emit(state.copyWith(
        novels: result.data,
        status: PageState.success,
        meta: result.meta,
        isLoadMore: false,
      ));
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure, isLoadMore: false));
    }
  }
}
