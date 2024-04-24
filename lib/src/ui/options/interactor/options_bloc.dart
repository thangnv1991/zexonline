import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:zexonline/src/core/repository/auth_repository.dart';
import 'package:zexonline/src/enums/enum_bottom_navigation_page.dart';
import 'package:zexonline/src/enums/enum_option_action.dart';
import 'package:zexonline/src/enums/enum_webview_type.dart';
import 'package:zexonline/src/ui/base/interactor/page_command.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/ui/widgets/base/toast/app_toast.dart';
import 'package:zexonline/src/utils/app_constants.dart';
import 'package:zexonline/src/utils/app_pages.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

part 'options_event.dart';
part 'options_state.dart';

class OptionsBloc extends Bloc<OptionsEvent, OptionsState> {
  final AuthRepository _authRepository = AuthRepository(Get.find());

  OptionsBloc() : super(const OptionsState(error: '', status: PageState.loading)) {
    on<OnChangeTabEvent>(_onChangeTabEvent);
    on<OnTapOptionItem>(_onTapOptionItem);
    on<OnClearPageCommand>((_, emit) => emit(state.copyWith(pageCommand: null)));
    on<OnGetNotice>((event, emit) => emit(state.copyWith(getNotice: event.getNotice)));
    on<FetchSetting>(_fetchSetting);
    on<UpdateSetting>(_updateSetting);
  }

  FutureOr<void> _onChangeTabEvent(OnChangeTabEvent event, Emitter<OptionsState> emit) {
    emit(state.copyWith(currentPage: event.tab));
  }

  FutureOr<void> _onTapOptionItem(OnTapOptionItem event, Emitter<OptionsState> emit) async {
    switch (event.action) {
      // case OptionAction.Rating:
      //   _onAppReview();
      //   return;
      // case OptionAction.ShareApp:
      //   _onShareApp();
      //   return;
      case OptionAction.JoinFacebook:
        _onJoinFacebook();
        return;
      case OptionAction.TermOfPrivacy:
        emit(state.copyWith(
            pageCommand: PageCommandNavigatorPage(page: AppPages.webView(WebViewType.Term))));
        return;
      case OptionAction.AboutUs:
        emit(state.copyWith(
            pageCommand: PageCommandNavigatorPage(page: AppPages.webView(WebViewType.AboutUs))));
        return;

      case OptionAction.ClearCaches:
        _clearImageCache();
        return;

      case OptionAction.Notification:
        _getNotice();
        return;
      default:
        return;
    }
  }

  void _onAppReview() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.openStoreListing(
        appStoreId: AppConstants.appStoreId,
        microsoftStoreId: AppConstants.microsoftStoreId,
      );
    }
  }

  void _onShareApp() async {
    try {
      await Share.share('https://flutter.dev', subject: AppConstants.appName);
    } catch (error) {
      print("_onShareApp error: $error");
    }
  }

  void _onJoinFacebook() async {
    try {
      Uri? url = Uri.tryParse(AppConstants.facebookUrl);
      if (url != null && await canLaunchUrl(url)) {
        launchUrl(url);
      }
    } catch (error) {
      print("_onJoinFacebook error: $error");
    }
  }

  void _clearImageCache() async {
    DefaultCacheManager manager = DefaultCacheManager();
    manager.emptyCache();
  }

  void _getNotice() async {
    //
  }

  FutureOr<void> _fetchSetting(FetchSetting event, Emitter<OptionsState> emit) async {
    try {
      final response = await _authRepository.getSettings();

      emit(state.copyWith(enableNotification: response.data?.notification ?? false));
    } catch (ex) {
      showErrorToast(ex.toString());
    }
  }

  FutureOr<void> _updateSetting(UpdateSetting event, Emitter<OptionsState> emit) async {
    try {
      _authRepository.updateSettings(event.enableNotification);

      emit(state.copyWith(enableNotification: event.enableNotification));
    } catch (ex) {
      showErrorToast(ex.toString());
    }
  }
}
