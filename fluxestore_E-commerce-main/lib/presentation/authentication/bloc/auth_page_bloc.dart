import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluxestore/repository/AuthRepo/auth_repository.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_page_event.dart';
part 'auth_page_state.dart';

class AuthPageBloc extends Bloc<AuthPageEvent, AuthPageState> {
  AuthPageBloc() : super(AuthPageInitial()) {
    on<AuthPageInitailEvent>(authPageInitailEvent);
    on<AuthPageShowLoginPageEvent>(authPageShowLoginPageEvent);
    on<AuthPageShowSignUpPageEvent>(authPageShowSignUpPageEvent);
    on<AuthPageLogInEvent>(authPageLogInEvent);
    on<AuthPageSignUpEvent>(authPageSignUpEvent);
    on<AuthPageInvalidPasswordInSignUpEvent>(
        authPageInvalidPasswordInSignUpEvent);
  }

  FutureOr<void> authPageInitailEvent(
      AuthPageInitailEvent event, Emitter<AuthPageState> emit) {
    emit(ShowSignUpPageState());
  }

  FutureOr<void> authPageShowLoginPageEvent(
      AuthPageShowLoginPageEvent event, Emitter<AuthPageState> emit) {
    emit(ShowLoginPagePageState());
  }

  FutureOr<void> authPageShowSignUpPageEvent(
      AuthPageShowSignUpPageEvent event, Emitter<AuthPageState> emit) {
    emit(ShowSignUpPageState());
  }

  late String rawToken;

  FutureOr<void> authPageLogInEvent(
      AuthPageLogInEvent event, Emitter<AuthPageState> emit) async {
    emit(AuthenticationLoadingState(isLoading: true));
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    var results = await AuthRepository().login(event.email, event.password);
    var responseMessage = results['message'];
    var responseStatus = results['status'];
    if (results['status']) {
      rawToken = results['token'];
      prefs.setString('token', rawToken);
      emit(AuthenticationLoadingState(isLoading: false));
      //emit snackbar
      emit(ShowSnackBarActionState(
          message: responseMessage, status: responseStatus));
      //emit landing page
      emit(AuthenticationSuccesState(token: rawToken));
    } else {
      emit(AuthenticationLoadingState(isLoading: false));
      emit(ShowSnackBarActionState(
          message: responseMessage, status: responseStatus));
    }
  }

  FutureOr<void> authPageSignUpEvent(
      AuthPageSignUpEvent event, Emitter<AuthPageState> emit) async {
    emit(AuthenticationLoadingState(isLoading: true));
    var results = await AuthRepository()
        .register(event.username, event.email, event.password);
    var responseMessage = results['message'];
    var responseStatus = results['status'];
    if (responseStatus) {
      emit(ShowSnackBarActionState(
          message: responseMessage, status: responseStatus));
      emit(AuthenticationLoadingState(isLoading: false));
      emit(ShowLoginPagePageState());
    }
  }

  FutureOr<void> authPageInvalidPasswordInSignUpEvent(
      AuthPageInvalidPasswordInSignUpEvent event, Emitter<AuthPageState> emit) {
    emit(AuthPageInvalidPasswordActionState());
  }
}
