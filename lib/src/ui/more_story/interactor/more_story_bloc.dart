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

part 'more_story_event.dart';
part 'more_story_state.dart';

class MoreStoryBloc extends Bloc<MoreStoryEvent, MoreStoryState> {
  final StoryRepository _storyRepository = StoryRepository();

  MoreStoryBloc() : super(const MoreStoryState(error: '', status: PageState.success)) {
    on<OnNavigatePage>((event, emit) => emit(state.copyWith(pageCommand: event.page)));
    on<OnClearPageCommand>((_, emit) => emit(state.copyWith(pageCommand: null)));
    on<GetListStories>(_getListStories);
  }

  FutureOr _getListStories(GetListStories event, emit) async {
    try {
      if (state.status == PageState.loading) return;
      emit(state.copyWith(status: PageState.loading));

      final request = StoryRequest(
        type: 'comic',
        page: event.page,
        limit: event.pageSize,
        sort: event.sort.api,
      );

      final StoriesResponse result = await _storyRepository.getStories(request);

      emit(
          state.copyWith(status: PageState.success, stories: result.data, currentPage: event.page));
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure));
    }
  }
}
