import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zexonline/src/core/model/genre.dart';
import 'package:zexonline/src/core/model/response/genres_response.dart';
import 'package:zexonline/src/core/repository/story_repository.dart';
import 'package:zexonline/src/enums/enum_bottom_navigation_page.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final StoryRepository _storyRepository = StoryRepository();

  MainBloc() : super(const MainState(error: '', status: PageState.loading)) {
    on<OnChangeTabEvent>(_onChangeTabEvent);
    on<GetGenres>(_getGenres);
  }

  FutureOr<void> _onChangeTabEvent(OnChangeTabEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(currentPage: event.tab));
  }

  FutureOr _getGenres(GetGenres event, emit) async {
    try {
      final GenreResponse result = await _storyRepository.getGenres();

      emit(state.copyWith(genres: result.data, status: PageState.success));
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure));
    }
  }
}
