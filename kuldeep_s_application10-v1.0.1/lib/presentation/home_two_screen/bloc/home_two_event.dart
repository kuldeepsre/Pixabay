// ignore_for_file: must_be_immutable

part of 'home_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///HomeTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class HomeTwoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the HomeTwo widget is first created.
class HomeTwoInitialEvent extends HomeTwoEvent {
  @override
  List<Object?> get props => [];
}
