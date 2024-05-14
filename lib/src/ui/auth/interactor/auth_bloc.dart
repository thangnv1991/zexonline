import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zexonline/src/core/repository/auth_repository.dart';
import 'package:zexonline/src/helper/validation.dart';
import 'package:zexonline/src/ui/base/interactor/page_states.dart';
import 'package:zexonline/src/utils/app_shared.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = AuthRepository(Get.find<AppShared>());

  AuthBloc()
      : super(const AuthState(
            error: '',
            status: PageState.success,
            email: '',
            password: '',
            validEmail: '',
            validPassword: '',
            username: '')) {
    on<OnClearData>(_onClearData);
    on<OnChangeInputUsername>(_onChangeInputUsername);
    on<OnChangeInputEmail>(_onChangeInputEmail);
    on<OnChangeInputPassword>(_onChangeInputPassword);
    on<OnClickSignUp>(_onClickSignUp);
    on<OnClickSignIn>(_onClickSignIn);
    on<OnCheckedRemember>(_onCheckedRemember);
  }

  FutureOr<void> _onChangeInputEmail(OnChangeInputEmail event, Emitter<AuthState> emit) {
    final valid = Validation.validateEmail(event.email);
    emit(state.copyWith(
      email: event.email,
      validEmail: valid,
    ));
  }

  FutureOr<void> _onChangeInputPassword(OnChangeInputPassword event, Emitter<AuthState> emit) {
    final valid = Validation.validatePassword(event.password);
    emit(state.copyWith(password: event.password, validPassword: valid));
  }

  FutureOr<void> _onClickSignUp(OnClickSignUp event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: PageState.loading));

      await _authRepository.signUp({
        "name": event.username,
        "email": event.email,
        "password": event.password,
        "password_confirmation": event.password
      });

      emit(state.copyWith(status: PageState.success));

      event.onSuccess.call();
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure));
    }
  }

  FutureOr<void> _onCheckedRemember(OnCheckedRemember event, Emitter<AuthState> emit) {
    emit(state.copyWith(isRemember: !event.isRemember));
  }

  FutureOr<void> _onClickSignIn(OnClickSignIn event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: PageState.loading));

      await _authRepository
          .login({"email": event.email, "password": event.password}, state.isRemember);

      emit(state.copyWith(status: PageState.success));

      event.onSuccess.call();
    } catch (ex) {
      emit(state.copyWith(status: PageState.failure));
    }
  }

  FutureOr<void> _onClearData(OnClearData event, Emitter<AuthState> emit) {
    emit(state.copyWith(
        error: '',
        status: PageState.success,
        email: '',
        password: '',
        validEmail: '',
        validPassword: '',
        username: ''));
  }

  FutureOr<void> _onChangeInputUsername(OnChangeInputUsername event, Emitter<AuthState> emit) {
    emit(state.copyWith(username: event.username));
  }
}
