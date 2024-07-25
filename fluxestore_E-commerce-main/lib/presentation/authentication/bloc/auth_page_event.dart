part of 'auth_page_bloc.dart';

@immutable
sealed class AuthPageEvent {}

class AuthPageInitailEvent extends AuthPageEvent {}

class AuthPageShowLoginPageEvent extends AuthPageEvent {}

class AuthPageShowSignUpPageEvent extends AuthPageEvent {}

class AuthPageSignUpEvent extends AuthPageEvent {
  final String username;
  final String email;
  final String password;

  AuthPageSignUpEvent({required this.username, required this.email, required this.password});
}

class AuthPageLogInEvent extends AuthPageEvent {
  final String email;
  final String password;

  AuthPageLogInEvent({required this.email, required this.password});
}

class AuthPageInvalidPasswordInSignUpEvent extends AuthPageEvent{}