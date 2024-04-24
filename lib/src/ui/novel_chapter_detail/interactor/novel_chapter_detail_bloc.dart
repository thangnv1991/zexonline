import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/model/chapter_model.dart';
import 'package:zexonline/src/core/model/response/chapter_detail_response.dart';
import 'package:zexonline/src/core/repository/story_repository.dart';
import 'package:zexonline/src/enums/enum_font_family.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/utils/app_shared.dart';

part 'novel_chapter_detail_event.dart';
part 'novel_chapter_detail_state.dart';

class NovelChapterDetailBloc extends Bloc<NovelDetailEvent, NovelChapterDetailState> {
  final StoryRepository _storyRepository = StoryRepository();
  final AppShared _appShared = Get.find<AppShared>();

  NovelChapterDetailBloc()
      : super(const NovelChapterDetailState(
          error: '',
          status: PageState.loading,
          fontFamily: FontFamily.cabin,
        )) {
    on<FetchChapterDetail>(_fetchChapterDetail);
    on<Init>(_init);
    on<OnHideAction>((event, emit) => emit(state.copyWith(hideAction: event.hideAction)));
    on<OnShowBottomSheet>((event, emit) => emit(state.copyWith(pageCommand: event.bottomSheet)));
    on<OnClearPageCommand>((_, emit) => emit(state.copyWith(pageCommand: null)));
    on<OnChangeViewStyle>(_onChangeViewStyle);
  }

  FutureOr<void> _init(Init event, Emitter<NovelChapterDetailState> emit) async {
    emit(state.copyWith(
      fontSize: _appShared.getNovelTextSize(),
      fontFamily: _appShared.getNovelTextFamily(),
      backgroundColor: _appShared.getNovelBackground(),
    ));
  }

  FutureOr<void> _fetchChapterDetail(
      FetchChapterDetail event, Emitter<NovelChapterDetailState> emit) async {
    try {
      if (event.chapterId == null) return;

      final ChapterDetailResponse result =
          await _storyRepository.getChapterDetail(event.chapterId!);

      emit(state.copyWith(chapter: result.data, status: PageState.success));
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure));
    }
  }

  FutureOr<void> _onChangeViewStyle(
      OnChangeViewStyle event, Emitter<NovelChapterDetailState> emit) async {
    emit(
      state.copyWith(
        fontSize: event.fontSize,
        fontFamily: event.fontFamily,
        backgroundColor: event.color,
      ),
    );

    if (event.fontSize != null) {
      _appShared.setNovelTextSize(event.fontSize!);
    }

    if (event.fontFamily != null) {
      _appShared.setNovelTextFamily(event.fontFamily!.name);
    }

    if (event.color != null) {
      _appShared.setNovelBackground(event.color!.value);
    }
  }
}
