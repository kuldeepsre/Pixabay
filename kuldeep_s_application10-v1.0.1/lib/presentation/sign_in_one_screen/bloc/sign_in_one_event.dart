// ignore_for_file: must_be_immutable

part of 'sign_in_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///SignInOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SignInOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the SignInOne widget is first created.
class SignInOneInitialEvent extends SignInOneEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends SignInOneEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
