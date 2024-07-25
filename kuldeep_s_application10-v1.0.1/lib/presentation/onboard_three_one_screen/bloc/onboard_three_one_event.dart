// ignore_for_file: must_be_immutable

part of 'onboard_three_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OnboardThreeOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OnboardThreeOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the OnboardThreeOne widget is first created.
class OnboardThreeOneInitialEvent extends OnboardThreeOneEvent {
  @override
  List<Object?> get props => [];
}
