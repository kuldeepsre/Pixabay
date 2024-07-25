// ignore_for_file: must_be_immutable

part of 'onboard_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OnboardTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OnboardTwoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the OnboardTwo widget is first created.
class OnboardTwoInitialEvent extends OnboardTwoEvent {
  @override
  List<Object?> get props => [];
}
