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
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';

part 'novel_event.dart';
part 'novel_state.dart';

class NovelBloc extends Bloc<NovelEvent, NovelState> {
  NovelBloc() : super(const NovelState(error: '', status: PageState.success, selectedTab: 0)) {
    on<OnChangeType>(_onChangeType);
    on<OnNavigatePage>((event, emit) => emit(state.copyWith(pageCommand: event.page)));
    on<OnClearPageCommand>((_, emit) => emit(state.copyWith(pageCommand: null)));
    on<GetNovelsByGenre>(_getNovelsByGenre);
  }

  final StoryRepository _storyRepository = StoryRepository();

  FutureOr _getNovelsByGenre(GetNovelsByGenre event, emit) async {
    try {
      if (state.isLoadMore) return;

      emit(state.copyWith(isLoadMore: true));

      await Future.delayed(const Duration(milliseconds: 500));

      int? page = event.page;
      final String currentKey = event.genreId;

      Map<String, Meta?> metaByGenre = Map.from(state.metaByGenre);
      Map<String, List<StoryModel>> novelsByGenre = Map.from(state.novelsByGenre);

      if (state.metaByGenre[currentKey] != null && page != 1) {
        final Meta currentMeta = state.metaByGenre[currentKey]!;
        if (currentMeta.nextPage == null) {
          emit(state.copyWith(isLoadMore: false));
          return;
        } else {
          page = currentMeta.nextPage!;
        }
      }

      final StoriesResponse result = await _storyRepository.getStories(StoryRequest(
        type: 'story',
        genres: currentKey,
        page: page ?? 1,
      ));

      metaByGenre[currentKey] = result.meta;

      if (novelsByGenre.keys.contains(currentKey)) {
        for (var item in result.data) {
          var index =
              novelsByGenre[currentKey]?.firstWhereOrNull((element) => element.id == item.id);

          if (index == null) {
            novelsByGenre[currentKey]!.add(item);
          }
        }
      } else {
        novelsByGenre[currentKey] = result.data;
      }

      emit(state.copyWith(
        novelsByGenre: novelsByGenre,
        status: PageState.success,
        metaByGenre: metaByGenre,
        isLoadMore: false,
      ));
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure, isLoadMore: false));
    }
  }

  FutureOr _onChangeType(OnChangeType event, emit) async {
    emit(state.copyWith(
      selectedTab: event.type,
      status: PageState.loading,
      isLoadMore: false,
    ));
  }
}
