import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/managers/firebase_messaging_manager.dart';
import 'package:zexonline/src/core/model/request/story_request.dart';
import 'package:zexonline/src/core/model/response/stories_response.dart';
import 'package:zexonline/src/core/model/story_model.dart';
import 'package:zexonline/src/core/repository/story_repository.dart';
import 'package:zexonline/src/enums/enum_sort_type.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/utils/app_shared.dart';
import 'package:zexonline/src/utils/app_utils.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final StoryRepository _storyRepository = StoryRepository();
  final FirebaseMessagingManager _firebaseMessagingManager = FirebaseMessagingManager();

  HomeBloc() : super(const HomeState(error: '', status: PageState.loading)) {
    on<OnClearPageCommand>((_, emit) => emit(state.copyWith(pageCommand: null)));
    on<OnNavigatePage>((event, emit) => emit(state.copyWith(pageCommand: event.page)));
    on<GetListStories>(_getListStories);
    on<RegisterFCM>(_registerFCM);
  }

  FutureOr _getListStories(GetListStories event, emit) async {
    try {
      final bool getHistories = event.sort?.api == null;

      final request = StoryRequest(
        page: event.page,
        limit: event.pageSize,
        type: 'comic',
      );

      final StoriesResponse result = getHistories
          ? AppUtils.isLogin()
              ? await _storyRepository.getHistories(request)
              : await _storyRepository.getHistoriesGuest(Get.find<AppShared>().getIdsReadNowGuest())
          : await _storyRepository.getStories(request);

      final key = getHistories ? '' : event.sort?.api;
      final map = {key: result.data};

      List<StoryModel>? latestUpdate = map[SortType.LatestUpdate.api];
      List<StoryModel>? topManga = map[SortType.Views.api];
      List<StoryModel>? nowReading = map[''];

      if (getHistories) {
        emit(state.copyWith(nowReading: nowReading ?? state.nowReading, status: PageState.success));
      } else if (event.sort == SortType.LatestUpdate) {
        emit(state.copyWith(
            latestUpdate: latestUpdate ?? state.latestUpdate, status: PageState.success));
      } else if (event.sort == SortType.Views) {
        emit(state.copyWith(topManga: topManga ?? state.topManga, status: PageState.success));
      } else {
        emit(state.copyWith(status: PageState.success));
      }
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure));
    }
  }

  FutureOr<void> _registerFCM(RegisterFCM event, Emitter<HomeState> emit) {
    if (AppUtils.isLogin()) {
      _firebaseMessagingManager.setupFirebaseFCM();
      _firebaseMessagingManager.processInitialMessage();
      _firebaseMessagingManager.registerTokenFCM();
    }
  }
}
