part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupFetchingState extends SignupState {}

class SignupFetchingFailureState extends SignupState {
final String message;

  SignupFetchingFailureState(this.message);
}

class SignupFetchingSuccessState extends SignupState {
  final List<SignupModel> response;
    SignupFetchingSuccessState(this.response);


}

class SignupPostingState extends SignupState {}

class SignupPostingFailureState extends SignupState {
final String message;

  SignupPostingFailureState(this.message);
}

class SignupPostingSuccessState extends SignupState {
  final List<SignupModel> response;
    SignupPostingSuccessState(this.response);

}

