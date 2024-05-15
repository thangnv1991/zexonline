import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zexonline/src/core/model/request/story_request.dart';
import 'package:zexonline/src/core/model/response/stories_response.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/core/repository/story_repository.dart';
import 'package:zexonline/src/enums/enum_sort_type.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';

part 'manga_event.dart';
part 'manga_state.dart';

class MangaBloc extends Bloc<MangaEvent, MangaState> {
  final StoryRepository _storyRepository = StoryRepository();

  MangaBloc() : super(const MangaState(error: '', status: PageState.loading)) {
    on<OnNavigatePage>((event, emit) => emit(state.copyWith(pageCommand: event.page)));
    on<OnClearPageCommand>((_, emit) => emit(state.copyWith(pageCommand: null)));
    on<GetListStories>(_getListStories);
  }

  FutureOr _getListStories(GetListStories event, emit) async {
    try {
      if (event.sort case SortType.NewChapter) {
        emit(state.copyWith(loadingNewChapter: true));
      } else if (event.sort case SortType.LatestUpdate) {
        emit(state.copyWith(loadingLatestUpdate: true));
      } else if (event.sort case SortType.Popular) {
        emit(state.copyWith(loadingPopular: true));
      } else if (event.sort case SortType.Rate) {
        emit(state.copyWith(loadingRate: true));
      }

      final request = StoryRequest(
        type: 'comic',
        page: event.page,
        limit: event.pageSize,
        sort: event.sort.api,
      );

      final StoriesResponse result = await _storyRepository.getStories(request);

      if (event.sort case SortType.NewChapter) {
        emit(state.copyWith(storiesNewChapter: result.data, loadingNewChapter: false));
      } else if (event.sort case SortType.LatestUpdate) {
        emit(state.copyWith(storiesLatestUpdate: result.data, loadingLatestUpdate: false));
      } else if (event.sort case SortType.Popular) {
        emit(state.copyWith(storiesPopular: result.data, loadingPopular: false));
      } else if (event.sort case SortType.Rate) {
        emit(state.copyWith(storiesRate: result.data, loadingRate: false));
      }

      emit(state.copyWith(status: PageState.success));
    } catch (ex) {
      emit(state.copyWith(
        status: PageState.failure,
        loadingNewChapter: false,
        loadingLatestUpdate: false,
        loadingPopular: false,
        loadingRate: false,
      ));
    }
  }
}
