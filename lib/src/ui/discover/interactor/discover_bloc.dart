import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/model/genre.dart';
import 'package:zexonline/src/core/model/request/story_request.dart';
import 'package:zexonline/src/core/model/response/meta.dart';
import 'package:zexonline/src/core/model/response/stories_response.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/core/repository/story_repository.dart';
import 'package:zexonline/src/enums/enum_sort_type.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/ui/main/interactor/main_bloc.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final StoryRepository _storyRepository = StoryRepository();

  DiscoverBloc() : super(const DiscoverState(error: '', status: PageState.loading)) {
    on<Init>(_init);
    on<OnSearchStories>(_onSearchStories);
    on<OnChangeKeySearch>(_onChangeKeySearch);
    on<OnShowBottomSheet>((event, emit) => emit(state.copyWith(pageCommand: event.bottomSheet)));
    on<OnClearPageCommand>((_, emit) => emit(state.copyWith(pageCommand: null)));
    on<OnNavigatePage>((event, emit) => emit(state.copyWith(pageCommand: event.page)));
    on<OnClearSelectedGenre>((event, emit) => emit(state.copyWith(genres: null)));
    on<OnChangeTab>(_onChangeTab);
    on<GetGenres>(_getGenres);
    on<GenresSelectedEvent>(_genresSelectedEvent);
  }

  FutureOr _getGenres(GetGenres event, emit) async {
    final List<Genre> genres = Get.find<MainBloc>().state.genres;

    final genres18 =
        genres.firstWhereOrNull((element) => element.id == "9b83e96d-83d3-4272-8f6d-b4fc4bf5a6c2");
    genres.remove(genres18);

    emit(state.copyWith(genres: genres));

    add(const OnSearchStories());
  }

  FutureOr<void> _init(Init event, Emitter<DiscoverState> emit) {
    emit(state.copyWith(genres: Get.find<MainBloc>().state.genres));
  }

  FutureOr<void> _onSearchStories(OnSearchStories event, Emitter<DiscoverState> emit) async {
    try {
      if (event.isLoadMore) {
        if (state.isLoadMore) return;
        emit(state.copyWith(isLoadMore: true));
      }

      final StoriesResponse result = await _storyRepository.getStories(StoryRequest(
        genres: state.genreSelected?.id,
        type: state.selectedTab == 0
            ? "comic"
            : state.selectedTab == 1
                ? "story"
                : "audio",
        sort: null,
        search: null,
        page: event.page,
      ));

      final bool refreshData = event.page == 1;

      emit(state.copyWith(
        meta: result.meta,
        stories: refreshData ? [...result.data] : [...state.stories, ...result.data],
        status: PageState.success,
        isLoadMore: false,
      ));
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure, isLoadMore: false));
    }
  }

  FutureOr<void> _onChangeKeySearch(OnChangeKeySearch event, Emitter<DiscoverState> emit) {
    emit(state.copyWith(keySearch: event.keySearch));
  }

  FutureOr<void> _onChangeTab(OnChangeTab event, Emitter<DiscoverState> emit) {
    emit(state.copyWith(selectedTab: event.type));

    add(const OnSearchStories());
  }

  FutureOr<void> _genresSelectedEvent(GenresSelectedEvent event, Emitter<DiscoverState> emit) {
    emit(state.copyWith(genreSelected: event.selectedGenre));

    add(const OnSearchStories());
  }
}
