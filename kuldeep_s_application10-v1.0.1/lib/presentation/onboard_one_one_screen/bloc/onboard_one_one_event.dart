// ignore_for_file: must_be_immutable

part of 'onboard_one_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OnboardOneOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OnboardOneOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the OnboardOneOne widget is first created.
class OnboardOneOneInitialEvent extends OnboardOneOneEvent {
  @override
  List<Object?> get props => [];
}
