part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupFetchEvent extends SignupEvent {}

class SignupPostEvent extends SignupEvent {}

