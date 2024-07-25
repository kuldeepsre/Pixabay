// ignore_for_file: must_be_immutable

part of 'onboard_two_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OnboardTwoOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OnboardTwoOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the OnboardTwoOne widget is first created.
class OnboardTwoOneInitialEvent extends OnboardTwoOneEvent {
  @override
  List<Object?> get props => [];
}
