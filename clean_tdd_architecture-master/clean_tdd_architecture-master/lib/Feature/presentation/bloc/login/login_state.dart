part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginFetchingState extends LoginState {}

class LoginFetchingFailureState extends LoginState {
final String message;

  LoginFetchingFailureState(this.message);
}

class LoginFetchingSuccessState extends LoginState {
  final List<LoginModel> response;
    LoginFetchingSuccessState(this.response);


}

class LodginPostingState extends LoginState {}

class LoginPostingFailureState extends LoginState {
final String message;

  LoginPostingFailureState(this.message);
}

class LoginPostingSuccessState extends LoginState {
  final List<LoginModel> response;
    LoginPostingSuccessState(this.response);

}

