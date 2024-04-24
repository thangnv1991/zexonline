import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zexonline/src/core/model/request/story_request.dart';
import 'package:zexonline/src/core/model/response/stories_response.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/core/repository/story_repository.dart';
import 'package:zexonline/src/enums/enum_library_tab.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/utils/app_utils.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final StoryRepository _storyRepository = StoryRepository();

  LibraryBloc()
      : super(const LibraryState(
          error: '',
          status: PageState.loading,
          currentTab: LibraryTab.History,
        )) {
    on<OnChangeLibraryTab>(_onChangeTab);
    on<OnNavigatePage>((event, emit) => emit(state.copyWith(pageCommand: event.page)));
    on<OnClearPageCommand>((_, emit) => emit(state.copyWith(pageCommand: null)));
    on<GetStories>(_getListStories);
  }

  FutureOr _onChangeTab(OnChangeLibraryTab event, emit) async {
    emit(state.copyWith(currentTab: event.tab));

    if (event.tab != LibraryTab.Download) {
      add(GetStories(tab: event.tab));
    } else {
      emit(state.copyWith(stories: [], status: PageState.success));
    }
  }

  FutureOr _getListStories(GetStories event, emit) async {
    try {
      if (!AppUtils.isLogin()) {
        emit(state.copyWith(status: PageState.login));
        return;
      }

      final storyRequest = StoryRequest(
        page: event.page,
        limit: event.pageSize,
      );

      if (event.loadMore) {
        final StoriesResponse result = event.tab == LibraryTab.History
            ? await _storyRepository.getHistories(storyRequest)
            : await _storyRepository.getFavorites(storyRequest);

        emit(state.copyWith(stories: state.stories + result.data, status: PageState.success));
      } else {
        emit(state.copyWith(stories: [], status: PageState.loading));

        final StoriesResponse result = event.tab == LibraryTab.History
            ? await _storyRepository.getHistories(storyRequest)
            : await _storyRepository.getFavorites(storyRequest);

        emit(state.copyWith(stories: result.data, status: PageState.success));
      }
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure));
    }
  }
}
