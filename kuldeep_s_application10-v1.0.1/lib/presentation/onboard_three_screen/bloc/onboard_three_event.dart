// ignore_for_file: must_be_immutable

part of 'onboard_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OnboardThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OnboardThreeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the OnboardThree widget is first created.
class OnboardThreeInitialEvent extends OnboardThreeEvent {
  @override
  List<Object?> get props => [];
}
