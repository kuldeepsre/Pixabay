part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginFetchEvent extends LoginEvent {


}

class LoginPostEvent extends LoginEvent {
  Map<String,String> body;
  LoginPostEvent({required this.body});
}

